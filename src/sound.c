#include "sound.h"
#include "hw.h"

/* SID at $d400: three voices of seven registers each, then volume. */
#define SID(v, r) HW(0xd400 + (v) * 7 + (r))
#define FREQ_LO 0
#define FREQ_HI 1
#define PW_LO 2
#define PW_HI 3
#define CTRL 4
#define AD 5
#define SR 6
#define SID_VOLUME HW(0xd418)

#define WAVE_TRIANGLE 0x10
#define WAVE_PULSE 0x40
#define WAVE_NOISE 0x80
#define GATE 0x01

#define FLAP 0
#define POINT 1
#define CRASH 2

/* Match the brighter pitch of the old build played at 120% emulator speed.
   All arguments are constants, so this adds no run-time multiplication. */
#define PITCH(f) (((unsigned long)(f) * 6 + 2) / 5)

/* Flap envelope: attack 3 (24 ms) swells the noise in instead of striking
   it, decay 5 (168 ms) to sustain 0, release 2 (48 ms). A zero attack made
   the flap sound like a hit. The crash thud keeps the sharp envelope. */
#define FLAP_AD 0x35
#define FLAP_SR 0x02
#define THUD_AD 0x08
#define THUD_SR 0x88

/* Per-voice effect state. timer counts simulation ticks with the gate held (0 means
   idle); when it reaches jump_at the pitch jumps to jump_freq, which gives
   the two-note chime. */
static char timer[3], wave[3], jump_at[3];
static unsigned freq[3], jump_freq[3];
static int step[3];

void sound_init(void)
{
    char v;
    SID_VOLUME = 15;
    for (v = 0; v < 3; ++v) {
        SID(v, CTRL) = 0;
        SID(v, PW_LO) = 0x00;
        SID(v, PW_HI) = 0x08;       /* 50% duty: a bright, hollow pulse */
        timer[v] = 0;
    }
    SID(FLAP, AD) = FLAP_AD; SID(FLAP, SR) = FLAP_SR;  /* soft wing whoosh */
    SID(POINT, AD) = 0x09; SID(POINT, SR) = 0x0a;   /* chime with a ringing tail */
    SID(CRASH, AD) = 0x08; SID(CRASH, SR) = 0x89;
}

void sound_off(void)
{
    char v;
    for (v = 0; v < 3; ++v) SID(v, CTRL) = 0;
    SID_VOLUME = 0;
}

static void apply(char v)
{
    SID(v, FREQ_LO) = (char)freq[v];
    SID(v, FREQ_HI) = (char)(freq[v] >> 8);
}

/* Start an effect on voice v: pitch f sliding by s per tick, gate held for
   n ticks. Restarting the gate retriggers the envelope. */
static void start(char v, unsigned f, int s, char n, char w)
{
    SID(v, CTRL) = 0;
    freq[v] = f; step[v] = s; timer[v] = n; wave[v] = w; jump_at[v] = 0;
    apply(v);
    SID(v, CTRL) = w | GATE;
}

void sound_tick(char ticks)
{
    char v;
    for (; ticks; --ticks) {
        for (v = 0; v < 3; ++v) {
            if (!timer[v]) continue;
            if (step[v]) {
                /* Clamp the slide so it can't wrap past the SID's range. */
                long f = (long)freq[v] + step[v];
                freq[v] = f < 0 ? 0 : (f > 0xffff ? 0xffff : (unsigned)f);
                apply(v);
            }
            if (--timer[v] == jump_at[v] && jump_at[v]) {
                freq[v] = jump_freq[v];
                apply(v);
            }
            if (!timer[v]) SID(v, CTRL) = wave[v];   /* release */
        }
    }
}

/* Flap: a soft, low noise swell rising a little, "fwip", like air pushed
   by a wing. The voice is shared with the crash thud, so set its envelope. */
void sound_flap(void)
{
    SID(FLAP, CTRL) = 0;
    SID(FLAP, AD) = FLAP_AD; SID(FLAP, SR) = FLAP_SR;
    start(FLAP, PITCH(0x1400), PITCH(0x0500), 4, WAVE_NOISE);
}

/* Point: two rising notes, "ding-ding". */
void sound_point(void)
{
    start(POINT, PITCH(0x3800), 0, 7, WAVE_TRIANGLE);
    jump_at[POINT] = 4;
    jump_freq[POINT] = PITCH(0x4b00);
}

/* Crash: a low thud on the flap voice (the bird can no longer flap) and a
   long falling sweep. */
void sound_crash(void)
{
    SID(FLAP, CTRL) = 0;
    SID(FLAP, AD) = THUD_AD; SID(FLAP, SR) = THUD_SR;
    start(FLAP, PITCH(0x0c00), -(int)PITCH(0x0100), 5, WAVE_NOISE);
    start(CRASH, PITCH(0x4000), -(int)PITCH(0x0300), 26, WAVE_PULSE);
}
