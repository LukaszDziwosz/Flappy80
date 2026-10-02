#include <conio.h>
#include <string.h>
#include <c128/vdc.h>
#include "hw.h"
#include "sound.h"
#include "bird_art.h"

#define COLS 80
#define ROWS 25
#define CELLS 2000
#define ATTR 0x0800
#define PAGE2 0x1000
#define FONT 0x2000
#define GLYPHS 240
#define BIRD 96
/* The bird is 5 x 3 cells. Two sets of 15 glyph codes from BIRD: while the
   bird stays in one cell row its set is reloaded in vertical blank; when it
   changes row the other set is loaded first and the cells switch to it. */
#define BIRD_CELLS 15
#define POSE_BYTES (BIRD_CELLS * 16)
/* VDC RAM: 3 wing positions x 8 pixel offsets, each laid out as 15 font
   slots so one block copy per font bank loads it. */
#define POSES 0x9000
#define PIPE_BODY_LEFT 10
#define PIPE_BODY_FILL 11
#define PIPE_BODY_RIGHT 12
#define PIPE_CAP_SPILL 13
#define PIPE_CAP_LEFT 14
#define PIPE_CAP_FILL 15
#define PIPE_CAP_RIGHT 16
/* Play area: columns PL..PR-1 hold the pipes and the ground; sky elsewhere. */
#define PL 0
#define PR 80
#define NPIPES 4
/* Score and best sit in the dirt as sky-coloured lettering cut out of
   solid glyphs, leaving every sky row to the game. */
#define HUD_ROW (GROUND + 2)
#define HUD_SCORE_X 4
#define HUD_BEST_X 74
#define HUD_DIGITS 17
#define HUD_S 27
#define HUD_B 28
/* Message panel: a rounded block in dirt colour with sky-coloured lettering
   cut out of it, covering whole cells so pipes are never half erased. */
#define INV_A 128
#define CORNER 154
#define PANEL_X 28
#define PANEL_W 24
#define PANEL_H 8
#define BX 30
#define SPACING 29
#define BW 40
#define BH 12
#define TOP 0
/* Sky rows 0..GROUND-1, grass strip on GROUND, dirt below. */
#define GROUND 21
#define GRASS 5
#define DIRT_COLOUR 13
#define FLOOR (GROUND * 8)
#define GAP 7
#define READY 0
#define PLAY 1
#define DEAD 2
#define PAUSE 3
#define DYING 4   /* hit a pipe: falling to the ground */
/* Scrolling speed in eighths of a pipe phase (2 pixels) per simulation tick:
   10 averages 3 pixels per displayed frame at the 6/5 simulation pace.
   It rises every SPEEDUP points, up to 3.6 pixels per displayed frame. */
#define SPEED_START 10
#define SPEED_MAX 12
#define SPEEDUP 10

struct Pipe { int x; char gap; char passed; };
struct Pipe pipes[NPIPES];
int bird_y, velocity;
unsigned score, best;
char state, phase, previous_keys, death_delay, flash, speed, scroll;
/* Displayed VDC page: 0 = screen $0000/attr $0800, 1 = $1000/$1800.
   During play the pages flip only when pipes cross a character boundary;
   the next pipe positions are drawn on the hidden page beforehand. */
char page, flip, stepped, prerendered;
/* field() rewrote the shadow: the next blank copies the whole displayed
   page to the hidden one instead of writing cell by cell. */
char redrawn;
static unsigned random_state = 0xace1;
static char screen[CELLS], attr[CELLS], marked[CELLS];
static unsigned row_addr[ROWS];
static unsigned dirty[CELLS], dirty_count;
/* Cells stale on the displayed page; the list also holds cells waiting only
   for the hidden page, so this lets quiet frames skip scanning it. */
static unsigned front_count;
static char shapes[GLYPHS][8], saved_font[GLYPHS * 16], saved_regs[37];
volatile unsigned frame_count, blank_overruns, max_dirty;
/* Six simulation ticks per five VDC frames gives the old game's 120% pace
   on a stock C128. Input edges are consumed once even on a two-tick frame.
   Display/page-flip work still runs only once per refresh. */
unsigned simulation_count;
char frame_ticks;
static char tempo;

/* Each tile has one foreground colour and the shared cyan background.
   Attribute high bits are VDC effects, NOT a second colour nibble. */
static const char letters[36][7] = {
 {14,17,19,21,25,17,14},{4,12,4,4,4,4,14},
 {14,17,1,2,4,8,31},{30,1,1,14,1,1,30},
 {2,6,10,18,31,2,2},{31,16,16,30,1,1,30},
 {14,16,16,30,17,17,14},{31,1,2,4,8,8,8},
 {14,17,17,14,17,17,14},{14,17,17,15,1,1,14},
 {14,17,17,31,17,17,17},{30,17,17,30,17,17,30},
 {14,17,16,16,16,17,14},{30,17,17,17,17,17,30},
 {31,16,16,30,16,16,31},{31,16,16,30,16,16,16},
 {14,17,16,23,17,17,15},{17,17,17,31,17,17,17},
 {14,4,4,4,4,4,14},{7,2,2,2,2,18,12},
 {17,18,20,24,20,18,17},{16,16,16,16,16,16,31},
 {17,27,21,21,17,17,17},{17,25,21,19,17,17,17},
 {14,17,17,17,17,17,14},{30,17,17,30,16,16,16},
 {14,17,17,17,21,18,13},{30,17,17,30,20,18,17},
 {15,16,16,14,1,1,30},{31,4,4,4,4,4,4},
 {17,17,17,17,17,17,14},{17,17,17,17,17,10,4},
 {17,17,17,21,21,21,10},{17,17,10,4,10,17,17},
 {17,17,10,4,4,4,4},{31,1,2,4,8,16,31}
};
char bird_set, bird_row = 255, bird_pose, shown_set, shown_row = 255;
/* The bird's cells in the shadow may have been overwritten (field(), or a
   pipe step over its columns): bird_draw rewrites them even in the same row. */
char bird_stale;
/* Pose held by each bird glyph set in each font bank (255: none). Only the
   bank about to be shown is loaded, one block copy a frame. */
static char set_pose[2][4];

/* Not inlined: the VICE test harness patches this routine to inject input. */
__noinline char keys(void)
{
    char k = 0, b;
    HW(0xdc00) = 0x7f;
    b = HW(0xdc01);
    if (!(b & 0x10)) k |= 1; /* SPACE */
    if (!(b & 0x40)) k |= 16; /* Q */
    HW(0xdc00) = 0xdf;
    if (!(HW(0xdc01) & 2)) k |= 2; /* P */
    /* Joystick port 2 shares port A with the column select: with every
       column released, a held fire button reads back as bit 4 low. */
    HW(0xdc00) = 0xff;
    if (!(HW(0xdc00) & 0x10)) k |= 1; /* joystick port 2 fire */
    return k;
}

/* CIA #2 timer A free-runs at 1 MHz as a stopwatch for frame pacing. */
#define CIA2_TA_LO HW(0xdd04)
#define CIA2_TA_HI HW(0xdd05)
#define CIA2_CRA HW(0xdd0e)
static unsigned show_time;

static unsigned stopwatch(void)
{
    char hi, lo;
    do {
        hi = CIA2_TA_HI;
        lo = CIA2_TA_LO;
    } while (hi != CIA2_TA_HI);
    return (hi << 8) | lo;
}

/* Wait for a new VDC vertical blank. A frame whose work ran into that blank
   shows at once instead of waiting a whole frame more: over 10 ms since the
   last show means this blank is new. A flip frame never gets here in a
   blank, because stage_frame waits it out before selecting the page. */
void wait_frame(void)
{
    if ((vdc.addr & 0x20) && (unsigned)(show_time - stopwatch()) > 10000)
        return;
    while (vdc.addr & 0x20) {}
    while (!(vdc.addr & 0x20)) {}
}

static void physical_cell(unsigned a, char g, char col)
{
    char changed = 0;
    if (screen[a] != g) { screen[a] = g; changed |= 1; }
    if (attr[a] != col) { attr[a] = col; changed |= 2; }
    if (!changed) return;
    /* Bits 1/2: screen/attr stale on the displayed page. Bits 4/8: stale on
       the hidden page. A cell stays listed until both pages hold it. */
    if (!marked[a]) dirty[dirty_count++] = a;
    if (!(marked[a] & 3)) ++front_count;
    marked[a] |= changed | changed << 2;
}

static void cell(char x, char y, char g, char col)
{
    physical_cell(row_addr[y] + x, g, col);
}

static void number(char x, unsigned n)
{
    char i;
    for (i = 0; i < 4; ++i) {
        cell(x + 3 - i, HUD_ROW, HUD_DIGITS + n % 10, DIRT_COLOUR); n /= 10;
    }
}

static char gap_next(void)
{
    random_state = (random_state >> 1) ^ ((random_state & 1) ? 0xb400 : 0);
    return 2 + random_state % 12;
}

static void background(char x, char y)
{
    char i, g = 32, col = 4;
    if (x < PL || x >= PR) {}
    else if (y == GROUND) { g = GRASS; col = 5; }
    else if (y > GROUND) { g = 0; col = DIRT_COLOUR; }
    else {
        for (i = 0; i < NPIPES; ++i) {
            int dx = (int)x - pipes[i].x;
            char gap = pipes[i].gap;
            if (dx >= -1 && dx < 8 && (y < gap || y >= gap + GAP)) {
                if (y == gap - 1 || y == gap + GAP) {
                    g = dx == -1 ? PIPE_CAP_SPILL :
                        (dx == 0 ? PIPE_CAP_LEFT :
                         (dx == 7 ? PIPE_CAP_RIGHT : PIPE_CAP_FILL));
                    col = 5;
                } else if (dx >= 0 && dx <= 6) {
                    g = dx == 0 ? PIPE_BODY_LEFT :
                        (dx == 6 ? PIPE_BODY_RIGHT : PIPE_BODY_FILL);
                    col = 4;
                }
            }
        }
    }
    cell(x, y, g, col);
}

static void make_shapes(void)
{
    char i, y;
    for (y = 0; y < 8; ++y) {
        shapes[0][y] = 255; shapes[1][y] = 0x7f;
        shapes[7][y] = 0xfe;
        shapes[2][y] = y == 1 ? 0 : 255;
        shapes[3][y] = y == 0 || y == 7 ? 0x7f : 0x60;
        shapes[4][y] = y == 0 || y == 7 ? 0xfe : 0x06;
    }
    for (i = 0; i < 36; ++i)
        for (y = 0; y < 7; ++y)
            shapes[i < 10 ? '0' + i : 'A' + i - 10][y] = letters[i][y] << 1;
    for (y = 0; y < 8; ++y) {
        for (i = 0; i < 10; ++i)
            shapes[HUD_DIGITS + i][y] = ~shapes['0' + i][y];
        shapes[HUD_S][y] = ~shapes['S'][y];
        shapes[HUD_B][y] = ~shapes['B'][y];
        for (i = 0; i < 26; ++i)
            shapes[INV_A + i][y] = ~shapes['A' + i][y];
    }
    for (y = 0; y < 8; ++y) {
        static const char round[8] = {0x0f, 0x3f, 0x7f, 0x7f, 0xff, 0xff, 0xff, 0xff};
        char r = round[y], m = 0;
        for (i = 0; i < 8; ++i) if (r & (1 << i)) m |= 0x80 >> i;
        shapes[CORNER][y] = r; shapes[CORNER + 1][y] = m;
        shapes[CORNER + 2][7 - y] = r; shapes[CORNER + 3][7 - y] = m;
    }
}

/* Pose library upload: pose = wing * 8 + pixel offset within the top cell. */
static void make_poses(void)
{
    char pose, ty, tx, line;
    vdc_mem_addr(POSES);
    for (pose = 0; pose < BIRD_WINGS * 8; ++pose)
        for (ty = 0; ty < 3; ++ty)
            for (tx = 0; tx < 5; ++tx) {
                for (line = 0; line < 8; ++line) {
                    int py = (int)ty * 8 + line - (pose & 7);
                    vdc_write(py >= 0 && py < BH ? bird_art[pose >> 3][py][tx] : 0);
                }
                for (line = 0; line < 8; ++line) vdc_write(0);
            }
}

/* Each font bank represents one two-pixel horizontal position. The character
   map only changes when a pipe crosses a character boundary. */
static void pipe_shapes(char shift)
{
    char glyph, line, pixel;
    for (glyph = PIPE_BODY_LEFT; glyph <= PIPE_CAP_RIGHT; ++glyph)
            for (line = 0; line < 8; ++line) {
                char bits = 0;
                for (pixel = 0; pixel < 8; ++pixel) {
                    int col = glyph == PIPE_CAP_SPILL ? -1 :
                        (glyph == PIPE_BODY_RIGHT ? 6 :
                         (glyph == PIPE_CAP_RIGHT ? 7 :
                          (glyph == PIPE_BODY_LEFT || glyph == PIPE_CAP_LEFT ? 0 : 3)));
                    int pos = col * 8 + pixel + shift * 2;
                    if (glyph <= PIPE_BODY_RIGHT) {
                        if (pos >= 8 && pos < 56) bits |= 0x80 >> pixel;
                    } else if (pos >= 0 && pos < 64 &&
                               (line != 1 || pos == 0 || pos == 63)) {
                        bits |= 0x80 >> pixel;
                    }
                }
                shapes[glyph][line] = bits;
            }
    /* Grass strip: solid edges around diagonal stripes that repeat every
       eight pixels. Shifting them two pixels per bank scrolls them with the
       pipes without screen writes. */
    static const char stripe[8] = {0xf0, 0x78, 0x3c, 0x1e, 0x0f, 0x87, 0xc3, 0xe1};
    for (line = 0; line < 8; ++line)
        shapes[GRASS][line] = line == 0 || line >= 6 ? 255 : stripe[(line + 8 - shift * 2) & 7];
}

static void bird_draw(void)
{
    static const char flap[4] = {0, 1, 2, 1};   /* up, mid, down, mid */
    char tx, ty, g, old = bird_row;
    int pixel_y = bird_y >> 4;
    bird_row = pixel_y >> 3;
    /* Clear only rows the bird has left; cells it still covers keep their
       codes unless the glyph set changes, so a pose change alone writes no
       cells (the glyphs are reloaded instead). */
    if (old != 255)
        for (ty = old; ty <= old + 2 && ty < GROUND; ++ty)
            if (ty < bird_row || ty > bird_row + 2)
                for (tx = BX; tx < BX + 5; ++tx) background(tx, ty);
    bird_pose = (state == PLAY ? flap[(simulation_count >> 2) & 3] : 1) * 8 + (pixel_y & 7);
    bird_set = bird_row == shown_row ? shown_set : shown_set ^ 1;
    /* In the same row with the same set, the cells already hold the codes:
       the pose is a glyph reload, so skip fifteen cell updates. */
    if (bird_row == old && !bird_stale) return;
    bird_stale = 0;
    g = BIRD + bird_set * BIRD_CELLS;
    for (ty = 0; ty < 3; ++ty) {
        if (bird_row + ty >= GROUND) break;
        for (tx = 0; tx < 5; ++tx)
            cell(BX + tx, bird_row + ty, g++, bird_colours[tx]);
    }
}

static void hidden_stale(unsigned a, char bits)
{
    if (!marked[a]) dirty[dirty_count++] = a;
    marked[a] |= bits;
}

static const char pipe_tiles[2][11] = {
    {32,10,11,11,11,11,11,12,32,32,32}, {13,14,15,15,15,15,15,15,16,32,32}
};
static const char cap_attr[11] = {5,5,5,5,5,5,5,5,5,4,4};

/* The VDC's update and block source addresses after the last copy: a copy
   ends with both advanced by its length, so the next one only writes the
   high bytes that differ. Anything else that sets the update address must
   call copy_reset() before the next copy. */
static unsigned copy_dst, copy_src;

static void copy_reset(void)
{
    copy_dst = copy_src = 0xffff;
}

/* VDC block copy (R24 bit 7 is set at startup): n bytes, src to dst. */
static inline void vdc_copy(unsigned dst, unsigned src, char n)
{
    if ((dst ^ copy_dst) & 0xff00) vdc_reg_write(VDCR_ADDRH, dst >> 8);
    vdc_reg_write(VDCR_ADDRL, dst);
    if ((src ^ copy_src) & 0xff00) vdc_reg_write(VDCR_BLOCK_ADDRH, src >> 8);
    vdc_reg_write(VDCR_BLOCK_ADDRL, src);
    vdc_reg_write(VDCR_DSIZE, n);
    copy_dst = dst + n; copy_src = src + n;
}

/* The same n bytes of rows consecutive screen rows. With edge set, tile is
   then written to the next byte: a copy leaves the update address there, so
   this costs no address change. */
static void copy_rows(unsigned dst, unsigned src, char rows, char n,
                      char edge, char tile)
{
    for (; rows; --rows, dst += COLS, src += COLS) {
        if (n) {
            vdc_copy(dst, src, n);
        } else {
            /* Only the edge cell is on screen. */
            vdc_mem_addr(dst);
            copy_dst = dst; copy_src = 0xffff;
        }
        if (edge) {
            vdc_reg_write(VDCR_DATA, tile);
            ++copy_dst;
        }
    }
}

/* The bird's glyph set in the font bank about to be shown. */
static void load_pose(void)
{
    if (set_pose[bird_set][phase] == bird_pose) return;
    set_pose[bird_set][phase] = bird_pose;
    copy_reset();
    vdc_copy(FONT + (unsigned)phase * 0x2000 + (BIRD + bird_set * BIRD_CELLS) * 16,
             POSES + bird_pose * POSE_BYTES, POSE_BYTES);
}

/* Draw pipe i one column further left on the hidden page, ahead of the step
   that moves it there. The hidden page last showed the pipe one column to
   the right of its current position, so eleven cells cover every change.
   Each row is the displayed row moved one cell left, copied inside the VDC.
   A pipe about to recycle is drawn leaving. Returns 0 if the pipe is off
   screen and nothing was drawn. */
static char prerender(char i)
{
    int left = pipes[i].x - 2;
    char first = 0, count = 11, gap = pipes[i].gap, y, row, edge, k, n;
    unsigned a, base = page ? 0 : PAGE2, shown = page ? PAGE2 : 0;
    if (left >= PR || left + 11 <= PL) return 0;
    if (left < PL) { first = PL - left; count -= first; left = PL; }
    if (left + count > PR) count = PR - left;
    /* A pipe entering on the right: a full-width copy would bring the next
       row's first cell into the last field column, so copy one cell less
       and write the pipe's own tile there. */
    edge = left + count == PR;
    k = edge ? PR - 1 - left + first : 0;
    n = count - edge;
    /* Body rows above the upper cap, the caps with their attributes, then
       body rows below the lower cap (none when the gap reaches the grass).
       The per-row work is kept out of the copy loop: this runs in the blank,
       and its CPU time used to cost more than the copies. */
    copy_reset();
    copy_rows(base + left, shown + left + 1, gap - 1, n, edge, pipe_tiles[0][k]);
    for (y = gap - 1; y <= gap + GAP; y += GAP + 1) {
        a = row_addr[y] + left;
        copy_rows(base + a, shown + a + 1, 1, n, edge, pipe_tiles[1][k]);
        copy_rows(base + ATTR + a, shown + ATTR + a + 1, 1, n, edge, cap_attr[k]);
    }
    a = row_addr[gap + GAP + 1] + left;
    copy_rows(base + a, shown + a + 1, GROUND - 1 - gap - GAP, n, edge, pipe_tiles[0][k]);
    /* The copy also moved the displayed bird one cell left. The bird is at
       most one row from where it was shown; column BX-1 never changes in the
       shadow, so mark it for the flip. Bird columns are forced there anyway. */
    if (left < BX && left + count >= BX) {
        row = (bird_y >> 4) >> 3;
        for (y = row ? row - 1 : 0; y <= row + 3; ++y)
            if (y < GROUND && (y < gap || y >= gap + GAP))
                hidden_stale(row_addr[y] + BX - 1, 12);
    }
    return 1;
}

/* Top row of the panel: the title panel sits above the waiting bird. */
static char panel_y;

static void panel_text(char y, const char *s)
{
    y += panel_y;
    char x = PANEL_X + (PANEL_W - (char)strlen(s)) / 2;
    for (; *s; ++s, ++x) {
        char c = *s, g = 0;
        if (c >= '0' && c <= '9') g = HUD_DIGITS + c - '0';
        else if (c >= 'A' && c <= 'Z') g = INV_A + c - 'A';
        cell(x, y, g, DIRT_COLOUR);
    }
}

static const char *score_line(const char *label, unsigned n)
{
    static char line[11];
    char i;
    for (i = 0; i < 6; ++i) line[i] = label[i];
    for (i = 9; i >= 6; --i) { line[i] = '0' + n % 10; n /= 10; }
    line[10] = 0;
    return line;
}

static void banner(void)
{
    char x, y;
    panel_y = state == READY ? 2 : 6;
    for (y = 0; y < PANEL_H; ++y)
        for (x = 0; x < PANEL_W; ++x) {
            char g = 0;
            if ((x == 0 || x == PANEL_W - 1) && (y == 0 || y == PANEL_H - 1))
                g = CORNER + (x != 0) + (y != 0) * 2;
            cell(PANEL_X + x, panel_y + y, g, DIRT_COLOUR);
        }
    if (state == READY) {
        panel_text(2, "FLAPPY 80");
        panel_text(5, "SPACE OR FIRE");
    } else if (state == DEAD) {
        panel_text(1, "GAME OVER");
        panel_text(3, score_line("SCORE ", score));
        panel_text(4, score_line("BEST  ", best));
        panel_text(6, "SPACE OR FIRE");
    } else if (state == PAUSE) {
        panel_text(2, "PAUSED");
        panel_text(5, "P TO CONTINUE");
    }
}

static void field(void)
{
    char x, y;
    redrawn = 1; bird_stale = 1;
    for (y = 0; y < ROWS; ++y)
        for (x = 0; x < COLS; ++x) background(x, y);
    cell(HUD_SCORE_X - 2, HUD_ROW, HUD_S, DIRT_COLOUR);
    cell(HUD_BEST_X - 2, HUD_ROW, HUD_B, DIRT_COLOUR);
    number(HUD_SCORE_X, score); number(HUD_BEST_X, best);
}

static void reset_game(void)
{
    char i;
    score = 0; velocity = 0; bird_y = 88 * 16; phase = 0;
    speed = SPEED_START; scroll = 0;
    for (i = 0; i < NPIPES; ++i) {
#ifdef BIRDLAB
        pipes[i].x = 0x3000;
#else
        pipes[i].x = PR + 4 + (int)i * SPACING;
#endif
        pipes[i].gap = gap_next(); pipes[i].passed = 0;
    }
    field(); bird_draw();
}

/* Leaving play: flash the sky, freeze the pipes and let the bird fall. */
static void crash(void)
{
    state = DYING; velocity = 0; flash = 3; sound_crash();
}

static void game_over(void)
{
    state = DEAD; death_delay = 30;
    if (score > best) best = score;
    number(HUD_BEST_X, best); banner();
}

static void update_game(char held)
{
    char pressed = held & ~previous_keys;
    char i, y, advance;
    previous_keys = held;
    if (state == DEAD) {
        if (death_delay) --death_delay;
        else if (pressed & 1) { state = PLAY; reset_game(); velocity = -34; sound_flap(); }
        return;
    }
    if (state == DYING) {
        velocity += 2;
        if (velocity > 48) velocity = 48;
        bird_y += velocity;
        if (bird_y >= (FLOOR - BH) * 16) {
            bird_y = (FLOOR - BH) * 16; bird_draw(); game_over();
        } else bird_draw();
        return;
    }
    if (state == READY) {
        ++random_state;
        if (pressed & 1) {
            state = PLAY; field(); velocity = -34; bird_draw(); sound_flap();
        }
        return;
    }
    if (pressed & 2) {
        if (state == PAUSE) { state = PLAY; field(); bird_draw(); }
        else { state = PAUSE; banner(); }
        return;
    }
    if (state == PAUSE) return;
    if (pressed & 1) { velocity = -34; sound_flap(); }
    velocity += 2;
    if (velocity > 48) velocity = 48;
    bird_y += velocity;
    if (bird_y < TOP * 16) { bird_y = TOP * 16; velocity = 0; }
    if (bird_y > (FLOOR - BH) * 16) {
        bird_y = (FLOOR - BH) * 16; bird_draw(); crash(); game_over(); return;
    }
    scroll += speed;
    advance = scroll >> 3; scroll &= 7;
#ifndef BIRDLAB
    /* show_frame prerenders the visible pipes in the blanks between steps.
       Any still missing (just after a resume) are drawn before the step. */
    if (phase + advance >= 4)
        while (prerendered < NPIPES) prerender(prerendered++);
#endif
    phase += advance;
    if (phase >= 4) {
        phase -= 4; stepped = 1; prerendered = 0;
#ifndef BIRDLAB
        for (i = 0; i < NPIPES; ++i) {
            int left;
            char gap, *sp, *ap;
            unsigned vis;
            --pipes[i].x;
            gap = pipes[i].gap;
            if (pipes[i].x < PL - 8) {
                /* Out on the left: recycle beyond the right edge, where
                   prerender draws it in as it enters. */
                pipes[i].x += NPIPES * SPACING;
                pipes[i].gap = gap_next(); pipes[i].passed = 0;
                continue;
            }
            /* The shadow follows the pipes (the hidden page already has
               them): set only the cells that differ from the strip one
               column to the right. As offsets from the pipe's left column
               x-1, those are 1, 2, 7 and 8 in the body, and 0, 1, 2, 8 and
               9 in a cap, with its attributes at 0 and 9. A pipe entering
               or leaving sets only those on screen (bits of vis). */
            left = pipes[i].x - 1;
            if (left >= PR || left + 10 <= PL) continue;
            if (left <= BX + 4 && left + 9 >= BX) bird_stale = 1;
            sp = screen + left; ap = attr + left;
            if (left >= PL && left + 10 <= PR) {
                for (y = 0; y < GROUND; ++y, sp += COLS, ap += COLS) {
                    if (y >= gap && y < gap + GAP) continue;
                    if (y == gap - 1 || y == gap + GAP) {
                        sp[0] = 13; sp[1] = 14; sp[2] = 15; sp[8] = 16; sp[9] = 32;
                        ap[0] = 5; ap[9] = 4;
                    } else {
                        sp[1] = 10; sp[2] = 11; sp[7] = 12; sp[8] = 32;
                    }
                }
                continue;
            }
            vis = 0x3ff;
            if (left < PL) vis = (vis << (PL - left)) & 0x3ff;
            if (left + 10 > PR) vis >>= left + 10 - PR;
            for (y = 0; y < GROUND; ++y, sp += COLS, ap += COLS) {
                if (y >= gap && y < gap + GAP) continue;
                if (y == gap - 1 || y == gap + GAP) {
                    if (vis & 1) { sp[0] = 13; ap[0] = 5; }
                    if (vis & 2) sp[1] = 14;
                    if (vis & 4) sp[2] = 15;
                    if (vis & 0x100) sp[8] = 16;
                    if (vis & 0x200) { sp[9] = 32; ap[9] = 4; }
                } else {
                    if (vis & 2) sp[1] = 10;
                    if (vis & 4) sp[2] = 11;
                    if (vis & 0x80) sp[7] = 12;
                    if (vis & 0x100) sp[8] = 32;
                }
            }
        }
#endif
    }
#ifndef BIRDLAB
    for (i = 0; i < NPIPES; ++i) {
        int left = pipes[i].x * 8 - (int)phase * 2;
        if (!pipes[i].passed && left + 64 <= BX * 8) {
            pipes[i].passed = 1;
            if (score < 9999) ++score;
            if (score % SPEEDUP == 0 && speed < SPEED_MAX) ++speed;
            number(HUD_SCORE_X, score); sound_point();
        }
        if (left < BX * 8 + BW && left + 64 > BX * 8 &&
            (bird_y < (int)pipes[i].gap * 128 ||
             bird_y + BH * 16 > (int)(pipes[i].gap + GAP) * 128)) {
            bird_draw(); crash(); return;
        }
    }
#endif
    bird_draw();
}

void prepare_frame(char held)
{
    char ticks;
    frame_ticks = 1;
    if (++tempo == 5) { tempo = 0; frame_ticks = 2; }
    stepped = 0;
    /* At SPEED_MAX two ticks advance at most three two-pixel phases, so
       even the fast frame crosses at most one character/page boundary.
       Keep stepped set if the first tick crossed that boundary. */
    for (ticks = frame_ticks; ticks; --ticks) {
        ++simulation_count;
        update_game(held);
    }
}

/* Screen bytes first, then attributes, so neighbouring cells (bird rows,
   panels, field redraws) stream through the VDC's auto-increment instead of
   setting an address for each. Gaps of up to two cells are filled from the
   shadow, which is always the correct content for the page being written. */
static void write_cells(unsigned base, char bits)
{
    unsigned *d, *end = dirty + dirty_count, *out = dirty;
    unsigned a, next = 0xffff;
    char m, want = bits & 5;
    for (d = dirty; d != end; ++d) {
        a = *d;
        if (!(marked[a] & want)) continue;
        if (a > next && a - next <= 2)
            while (next < a) vdc_write(screen[next++]);
        else if (a != next)
            vdc_mem_addr(base + a);
        vdc_write(screen[a]);
        next = a + 1;
    }
    /* Attributes, then keep only cells still stale on some page. A flip
       makes the hidden page current: what was stale on the displayed page
       becomes stale on the new hidden page. */
    want = bits & 10; next = 0xffff; base += ATTR;
    for (d = dirty; d != end; ++d) {
        a = *d;
        m = marked[a];
        if (m & want) {
            if (a > next && a - next <= 2)
                while (next < a) vdc_write(attr[next++]);
            else if (a != next)
                vdc_mem_addr(base + a);
            vdc_write(attr[a]);
            next = a + 1;
        }
        m = bits == 12 ? (m & 3) << 2 : m & 12;
        marked[a] = m;
        if (m) *out++ = a;
    }
    dirty_count = out - dirty;
    front_count = 0;
}

/* Before vertical blank: on a flip frame, complete the hidden page and
   select it. That happens only at a pipe step. Every other frame, including
   the title, pause, falling and game-over screens, writes its few changed
   cells to the displayed page in the blank, where a write costs a fifth of
   what it does during the display. The hidden page is then left stale until
   play resumes through field(), whose whole-page copy brings it up to date.

   The page registers are written during active display, before the blank
   in which show_frame changes the font bank. The VDC may take the display
   and attribute addresses at the start of vertical blank or at the start
   of the next frame; written here, both mean the frame after this blank,
   the same frame that first uses the new font phase. */
void stage_frame(void)
{
    char tx, ty, row;
    if (dirty_count > max_dirty) max_dirty = dirty_count;
    flip = stepped;
    if (!flip) return;
    {
        /* A prerendered pipe may have drawn over an unchanged bird cell:
           each covered columns x-1..x+9 of its new position, in every row
           outside its gap (caps included). */
        char i, gap;
        row = (bird_y >> 4) >> 3;
        for (i = 0; i < NPIPES; ++i) {
            int x = pipes[i].x;
            if (x - 1 >= BX + 5 || x + 10 <= BX) continue;
            gap = pipes[i].gap;
            for (ty = row; ty < row + 3 && ty < GROUND; ++ty)
                if (ty < gap || ty >= gap + GAP)
                    for (tx = BX; tx < BX + 5; ++tx) hidden_stale(row_addr[ty] + tx, 12);
        }
    }
    write_cells(page ? 0 : PAGE2, 12);
    while (vdc.addr & 0x20) {}
    page ^= 1;
    vdc_reg_write(VDCR_DISP_ADDRH, page ? PAGE2 >> 8 : 0);
    vdc_reg_write(VDCR_ATTR_ADDRH, (page ? PAGE2 + ATTR : ATTR) >> 8);
}

/* In vertical blank, where a VDC access costs a fifth of what it does
   during the display: the font phase and the bird pose. Frames without a
   flip then update the bird and score directly on the displayed page.
   Last, the visible pipes not yet drawn ahead are prerendered on the hidden
   page; running past the blank only costs time. */
void show_frame(void)
{
    show_time = stopwatch();
    vdc_reg_write(VDCR_CHAR_ADDRH, (saved_regs[28] & 0x0f) | 0x10 | ((phase + 1) << 5));
    /* The sky is the VDC background colour: a crash flashes it white. */
    if (flash) vdc_reg_write(VDCR_COLOR, --flash ? 0x0f : 0x06);
    /* The bird's set in the bank just selected, before the raster reaches
       it. A bird moving to another cell row switches to the other set. */
    load_pose();
    shown_set = bird_set; shown_row = bird_row;
    if (!(vdc.addr & 0x20)) ++blank_overruns;
    ++frame_count;
    if (!flip && front_count) write_cells(page ? PAGE2 : 0, 3);
    if (!flip && redrawn) {
        /* After a full redraw the displayed page is the shadow: copy it all
           to the hidden page (both planes, 8 x 250 bytes each) and drop the
           hidden marks, instead of ~1000 cell writes at the next flip. */
        unsigned a, base = page ? 0 : PAGE2, shown = page ? PAGE2 : 0;
        copy_reset();
        for (a = 0; a < CELLS; a += 250) {
            vdc_copy(base + a, shown + a, 250);
            vdc_copy(base + ATTR + a, shown + ATTR + a, 250);
        }
        for (a = 0; a < dirty_count; ++a) marked[dirty[a]] = 0;
        dirty_count = 0;
        redrawn = 0;
        /* The copy also replaced any pipes already drawn ahead. */
        prerendered = 0;
    }
#ifndef BIRDLAB
    /* All at once, right after the step: the frames after a step have time
       to spare, and the blank before the next step is left free, so that
       step frame has the whole frame for its own work. */
    if (state == PLAY)
        while (prerendered < NPIPES) prerender(prerendered++);
#endif
}

/* The VDC registers as the game found them, skipping the read-only ones and
   the block-copy commands. Counted down: Oscar64 1.32 -O2 compiled the
   counting-up loop to enter with its index register unset. */
static void restore_vdc(void)
{
    char i = 30;
    do {
        --i;
        if (i != 16 && i != 17)
            vdc_reg_write((VDCRegister)i, saved_regs[i]);
    } while (i);
}

int main(void)
{
    unsigned i;
    char x, y, g, held;
    char old_vic, old_speed, old_pra, old_ddra, old_ddrb, old_cia2_cra;
    iocharmap(IOCHM_ASCII);
    dispmode80col();
    textcursor(0);
    sound_init();
    clrscr();
    __asm { sei }
    old_vic = HW(0xd011) & 0x7f;
    old_speed = HW(0xd030);
    old_pra = HW(0xdc00);
    old_ddra = HW(0xdc02);
    old_ddrb = HW(0xdc03);
    HW(0xd011) = old_vic & 0x6f;
    HW(0xd030) = 1;
    HW(0xdc02) = 0xff;
    HW(0xdc03) = 0;
    old_cia2_cra = CIA2_CRA;
    CIA2_TA_LO = 0xff;
    CIA2_TA_HI = 0xff;
    CIA2_CRA = 0x11;   /* start, continuous, load the latch */
    memset(set_pose, 255, sizeof(set_pose));
    for (i = 0; i < 37; ++i)
        saved_regs[i] = vdc_reg_read((VDCRegister)i);
    vdc_reg_write(VDCR_HSTART, 0x80);
    vdc_mem_addr(FONT);
    for (i = 0; i < sizeof(saved_font); ++i)
        saved_font[i] = vdc_read();
    vdc_reg_write(VDCR_CHAR_ADDRH, (saved_regs[28] & 0x0f) | 0x30);
    make_shapes();
    make_poses();
    vdc_mem_addr(FONT);
    for (x = 0; x < 4; ++x) {
        pipe_shapes(x);
        vdc_mem_addr(FONT + (unsigned)x * 0x2000);
        for (g = 0; g < GLYPHS; ++g) {
            for (y = 0; y < 8; ++y) vdc_write(shapes[g][y]);
            for (y = 0; y < 8; ++y) vdc_write(0);
        }
    }
    vdc_reg_write(VDCR_HTOTAL, 0x7e);
    vdc_reg_write(VDCR_HSYNC, 0x66);
    vdc_reg_write(VDCR_SYNCSIZE, 0x49);
    vdc_reg_write(VDCR_VTOTAL, 0x20);
    vdc_reg_write(VDCR_VADJUST, 0);
    vdc_reg_write(VDCR_VSYNC, 0x1d);
    vdc_reg_write(VDCR_LACE, 0);
    vdc_reg_write(VDCR_DISP_ADDRH, 0);
    vdc_reg_write(VDCR_DISP_ADDRL, 0);
    vdc_reg_write(VDCR_ATTR_ADDRH, ATTR >> 8);
    vdc_reg_write(VDCR_ATTR_ADDRL, 0);
    vdc_reg_write(VDCR_CHAR_ADDRH, (saved_regs[28] & 0x0f) | 0x30);
    vdc_reg_write(VDCR_HDISPLAY, COLS);
    vdc_reg_write(VDCR_VDISPLAY, ROWS);
    vdc_reg_write(VDCR_CSIZE, 7);
    vdc_reg_write(VDCR_CHEIGHT, 7);
    vdc_reg_write(VDCR_CWIDTH, 0x78);
    vdc_reg_write(VDCR_CURSOR_START, 0x20);
    vdc_reg_write(VDCR_VSCROLL, 0x80); /* bit 7: block copy mode */
    vdc_reg_write(VDCR_HSCROLL, 0x47 | 0x40);
    vdc_reg_write(VDCR_ROWINC, 0);
    vdc_reg_write(VDCR_COLOR, 0x06);
    for (i = 0; i < ROWS; ++i) row_addr[i] = i * COLS;
    state = READY;
    reset_game();   /* field() fills the whole shadow */
    banner();
    /* Initialize both screen pages while the display is disabled. */
    for (x = 0; x < 2; ++x) {
        vdc_mem_addr(x ? PAGE2 : 0);
        for (i = 0; i < CELLS; ++i) vdc_write(screen[i]);
        vdc_mem_addr((x ? PAGE2 : 0) + ATTR);
        for (i = 0; i < CELLS; ++i) vdc_write(attr[i]);
    }
    memset(marked, 0, sizeof(marked));
    dirty_count = 0;
    redrawn = 0;
    wait_frame();
    show_frame();
    vdc_reg_write(VDCR_HSTART, saved_regs[34]);
    for (;;)
    {
        held = keys();
        if (held & 16)
            break;
        prepare_frame(held);
        sound_tick(frame_ticks);
        stage_frame();
        wait_frame();
        show_frame();
    }
    vdc_reg_write(VDCR_HSTART, 0x80);
    vdc_reg_write(VDCR_CHAR_ADDRH, saved_regs[28]);
    vdc_mem_addr(FONT);
    for (i = 0; i < sizeof(saved_font); ++i)
        vdc_write(saved_font[i]);
    restore_vdc();
    vdc_reg_write(VDCR_HSTART, saved_regs[34]);
    sound_off();
    HW(0xdc00) = old_pra;
    HW(0xdc02) = old_ddra;
    HW(0xdc03) = old_ddrb;
    HW(0xd030) = old_speed;
    HW(0xd011) = old_vic;
    CIA2_CRA = old_cia2_cra;
    __asm { cli }
    clrscr();
    gotoxy(35, 10);
    for (x = 0; x < 9; ++x)
        putch("THANK YOU"[x]);
    return 0;
}
