/* VDC timing benchmark: CPU writes versus VDC block copy, on real hardware.
   Run from BASIC in 80-column mode. Results are CIA2 timer clocks
   (about 1 us each; 0.985 MHz PAL, 1.023 MHz NTSC), measured at 2 MHz.
   Uses VDC $1000-$1FFF, which the Kernal leaves free, and restores R24. */
#include <stdio.h>
#include <c128/vdc.h>
#include "../src/hw.h"

#define SRC 0x1000
#define DST 0x1800
#define REPS 8

static unsigned now(void)
{
    char h, l;
    do { h = HW(0xdd05); l = HW(0xdd04); } while (h != HW(0xdd05));
    return ((unsigned)h << 8) | l;
}

static void wait_ready(void) { while (!(vdc.addr & 0x80)) {} }

static void blank_start(void)
{
    while (vdc.addr & 0x20) {}
    while (!(vdc.addr & 0x20)) {}
}

/* Just after the first display row starts. */
static void display_start(void)
{
    blank_start();
    while (vdc.addr & 0x20) {}
}

static void copy(unsigned dst, unsigned src, char n)
{
    vdc_reg_write(VDCR_ADDRH, dst >> 8);
    vdc_reg_write(VDCR_ADDRL, (char)dst);
    vdc_reg_write(VDCR_BLOCK_ADDRH, src >> 8);
    vdc_reg_write(VDCR_BLOCK_ADDRL, (char)src);
    vdc_reg_write(VDCR_DSIZE, n);
}

static unsigned result_display[5], result_blank[5];
static const char sizes[5] = {1, 16, 64, 144, 255};
static unsigned cpu_seq, cpu_sparse, pose_display, pose_blank, copy_errors;

static unsigned time_copy(char n, char in_blank)
{
    unsigned long total = 0;
    unsigned t;
    char r;
    for (r = 0; r < REPS; ++r) {
        if (in_blank) blank_start(); else display_start();
        t = now();
        copy(DST, SRC, n);
        wait_ready();
        total += (unsigned)(t - now());
    }
    return (unsigned)(total / REPS);
}

static unsigned time_pose(char in_blank)
{
    unsigned t;
    char b;
    if (in_blank) blank_start(); else display_start();
    t = now();
    for (b = 0; b < 4; ++b) copy(DST + b * 0x100, SRC, 144);
    wait_ready();
    return t - now();
}

int main(void)
{
    char i, old_speed, old_r24;
    unsigned t, a;
    old_r24 = vdc_reg_read(VDCR_VSCROLL);
    old_speed = HW(0xd030);
    /* Source pattern for the correctness check. */
    vdc_mem_addr(SRC);
    for (a = 0; a < 256; ++a) vdc_write((char)(a * 7 + 3));
    __asm { sei }
    HW(0xd030) = 1;
    HW(0xdd0e) = 0;
    HW(0xdd04) = 0xff; HW(0xdd05) = 0xff;
    HW(0xdd0e) = 0x11;
    vdc_reg_write(VDCR_VSCROLL, old_r24 | 0x80);

    display_start();
    t = now();
    vdc_mem_addr(DST);
    for (i = 0; i < 144; ++i) vdc_write(i);
    wait_ready();
    cpu_seq = t - now();

    display_start();
    t = now();
    for (i = 0; i < 16; ++i) { vdc_mem_addr(DST + i * 8); vdc_write(i); }
    wait_ready();
    cpu_sparse = t - now();

    for (i = 0; i < 5; ++i) {
        result_display[i] = time_copy(sizes[i], 0);
        result_blank[i] = time_copy(sizes[i], 1);
    }
    pose_display = time_pose(0);
    pose_blank = time_pose(1);

    copy(DST, SRC, 255);
    wait_ready();
    vdc_mem_addr(DST);
    for (a = 0; a < 255; ++a)
        if (vdc_read() != (char)(a * 7 + 3)) ++copy_errors;

    vdc_reg_write(VDCR_VSCROLL, old_r24);
    HW(0xd030) = old_speed;
    __asm { cli }

    printf("VDC BENCHMARK  (CIA2 CLOCKS, ~1 US, CPU AT 2 MHZ)\n\n");
    printf("CPU 144 SEQUENTIAL WRITES      %6u  (%u PER BYTE)\n", cpu_seq, cpu_seq / 144);
    printf("CPU 16 x (ADDRESS + 1 BYTE)    %6u  (%u PER CELL)\n\n", cpu_sparse, cpu_sparse / 16);
    printf("BLOCK COPY BYTES  START IN DISPLAY  START IN BLANK\n");
    for (i = 0; i < 5; ++i)
        printf("        %3u        %6u          %6u\n", sizes[i], result_display[i], result_blank[i]);
    printf("\nPOSE 4 x 144 BYTES             %6u (DISPLAY) %6u (BLANK)\n", pose_display, pose_blank);
    printf("COPY CHECK: %u OF 255 BYTES WRONG\n", copy_errors);
    return 0;
}
