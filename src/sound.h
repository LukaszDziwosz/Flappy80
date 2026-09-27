#ifndef SOUND_H
#define SOUND_H

/* Pull in the SID driver implementation when this header is included. */
#pragma compile("sound.c")

/* Minimal SID driver, no interrupts. Each effect owns a voice so they never
   cut each other off: voice 1 flap, voice 2 point, voice 3 crash.
   sound_tick() is called once per game frame to slide pitches and release
   gates when an effect's timer expires. */
void sound_init(void);
void sound_tick(void);
void sound_off(void);

/* Effects. */
void sound_flap(void);
void sound_point(void);
void sound_crash(void);

#endif /* SOUND_H */
