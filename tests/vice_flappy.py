#!/usr/bin/env python3
"""Exercise the actual Oscar64 binary and VDC RAM, using VICE's binary monitor.
Run from the project root: python3 tests/vice_flappy.py [--ntsc] [--ram 64]
The dedicated emulator is closed after the test. No third-party Python modules.
"""
import argparse
import socket
import struct
import subprocess
import time
import sys
import zlib
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / 'tools'))
import bird_art  # noqa: E402


class Monitor:
    def __init__(self, port):
        self.s = socket.create_connection(('127.0.0.1', port), 5)
        self.s.settimeout(10)
        self.s.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
        self.rid = 0

    def read(self, n):
        data = bytearray()
        while len(data) < n:
            part = self.s.recv(n - len(data))
            if not part:
                raise EOFError('VICE closed the monitor')
            data.extend(part)
        return bytes(data)

    def response(self):
        _, _, size, kind, error, rid = struct.unpack('<BBIBBI', self.read(12))
        return kind, error, rid, self.read(size)

    def cmd(self, command, body=b''):
        self.rid += 1
        self.s.sendall(struct.pack('<BBIIB', 2, 2, len(body), self.rid, command) + body)
        while True:
            kind, error, rid, data = self.response()
            if rid == self.rid:
                if error:
                    raise RuntimeError(f'VICE command {command:02x}: error {error:02x}')
                return data

    def memory(self, addr, size, bank=0):
        return self.cmd(1, struct.pack('<BHHBH', 0, addr, addr+size-1, 0, bank))[2:]

    def write(self, addr, data, bank=0):
        self.cmd(2, struct.pack('<BHHBH', 0, addr, addr+len(data)-1, 0, bank)+data)

    def checkpoint(self, addr):
        return struct.unpack_from('<I', self.cmd(0x12, struct.pack('<HHBBBB', addr, addr, 1, 1, 4, 0)))[0]

    def vdc_register(self, reg):
        self.write(0xd600, bytes([reg]), 3)
        return self.cmd(1, struct.pack('<BHHBH', 1, 0xd601, 0xd601, 0, 3))[2]

    def vdc_byte(self, addr):
        for reg, data in ((18, addr>>8), (19, addr&255), (31, 0)):
            self.write(0xd600, bytes([reg]), 3)
            if reg != 31:
                self.write(0xd601, bytes([data]), 3)
        return self.cmd(1, struct.pack('<BHHBH', 1, 0xd601, 0xd601, 0, 3))[2]

    def next_frame(self):
        self.cmd(0xaa)
        while True:
            kind, error, rid, data = self.response()
            if kind == 0x62:
                return

    def to_checkpoint(self, *checkpoints):
        """Resume until any of the given checkpoints fires; return its address."""
        self.cmd(0xaa)
        while True:
            kind, error, rid, data = self.response()
            if kind == 0x62:
                return struct.unpack_from('<H', data, 0)[0]

    def capture(self, filename):
        data = self.cmd(0x84, b'\0\0')
        info_len = struct.unpack_from('<I', data)[0]
        w, h = struct.unpack_from('<HH', data, 12)
        offset = 4 + info_len
        size = struct.unpack_from('<I', data, offset)[0]
        pixels = data[offset+4:offset+4+size]
        if len(pixels) == size-4:
            pixels += pixels[-1:] * 4  # VICE 3.10 omits four final border pixels.
        assert len(pixels) == w*h
        pal = self.cmd(0x91, b'\0')
        palette, pos = bytearray(), 2
        for _ in range(struct.unpack_from('<H', pal)[0]):
            length = pal[pos]
            palette.extend(pal[pos+1:pos+4])
            pos += length+1
        def chunk(tag, contents):
            return struct.pack('>I', len(contents))+tag+contents+struct.pack('>I', zlib.crc32(tag+contents))
        raw = b''.join(b'\0'+pixels[y*w:(y+1)*w] for y in range(h))
        Path(filename).write_bytes(b'\x89PNG\r\n\x1a\n'+
            chunk(b'IHDR', struct.pack('>IIBBBBB', w,h,8,3,0,0,0))+
            chunk(b'PLTE', palette)+chunk(b'IDAT', zlib.compress(raw))+chunk(b'IEND', b''))

    def screenshot_pixels(self):
        data = self.cmd(0x84, b'\0\0')
        info_len = struct.unpack_from('<I', data)[0]
        w, h = struct.unpack_from('<HH', data, 12)
        offset = 4 + info_len
        size = struct.unpack_from('<I', data, offset)[0]
        pixels = data[offset+4:offset+4+size]
        if len(pixels) == size-4:
            pixels += pixels[-1:] * 4
        assert len(pixels) == w*h
        return w, h, pixels


# Play field layout (src/flappy.c): columns PL..PR-1, bird column, gap rows.
PL, PR, BX, GAP, GROUND, NPIPES = 0, 80, 30, 7, 21, 4
FW = PR - PL


def check_game(m, syms):
    def value(name, size=2):
        return int.from_bytes(m.memory(syms[name], size), 'little')
    def put(name, n, size=2):
        m.write(syms[name], n.to_bytes(size, 'little', signed=n < 0))
    key_addr = syms['keys']
    checkpoint = m.checkpoint(key_addr)
    m.next_frame()
    original_font = m.memory(syms['saved_font'], 240*16)
    saved_regs = m.memory(syms['saved_regs'], 37)
    def held(mask):
        m.write(key_addr, bytes([0xa9, mask, 0x60]))
    # The game double-buffers: page 0 is $0000/$0800, page 1 is $1000/$1800.
    # At the loop checkpoint the displayed page must match the CPU shadow.
    def base():
        return 0x1000 if value('page', 1) else 0
    def vdc_screen():
        return m.memory(base(), 2000, 10)
    def verify():
        actual = vdc_screen()
        expected = m.memory(syms['screen'], 2000)
        assert actual == expected, ('screen diverged', [(i//80, i%80, a, b) for i,(a,b) in enumerate(zip(actual,expected)) if a != b][:8])
        assert m.memory(base()+0x800, 2000, 10) == m.memory(syms['attr'], 2000)
        assert m.vdc_register(12) == base() >> 8 and m.vdc_register(13) == 0
        assert m.vdc_register(20) == (base()+0x800) >> 8 and m.vdc_register(21) == 0
        assert m.vdc_register(27) == 0
        assert m.vdc_register(28) == (saved_regs[28] & 0x0f) | 0x10 | ((value('phase',1)+1)<<5)
        assert m.vdc_register(25) & 0xc0 == 0x40, 'not attribute character mode'
        assert all(c < 16 for c in m.memory(syms['attr'], 2000)), 'attribute effect bits set'
    def pixels():
        cells = vdc_screen()
        shapes = m.memory(syms['shapes'], 240*8)
        shift = value('phase',1)
        # Bird glyphs are block-copied poses: read them from the shown bank.
        bird_font = m.memory(0x2000*(shift+1)+96*16, 30*16, 10)
        def glyph_byte(g, line):
            if 96 <= g < 126:
                return bird_font[(g-96)*16+line]
            if 10 <= g <= 16:
                cap = g >= 13
                col = {10:0,11:3,12:6,13:-1,14:0,15:3,16:7}[g]
                bits = 0
                for pixel in range(8):
                    pos = col*8+pixel+shift*2
                    if ((0 <= pos < 64 and (line != 1 or pos in (0,63))) if cap
                            else (8 <= pos < 56)):
                        bits |= 0x80 >> pixel
                return bits
            return shapes[g*8+line]
        actual = bytes(glyph_byte(cells[(y//8)*80+x], y%8)
                       for y in range(GROUND*8) for x in range(PL, PR))
        expected = bytearray(GROUND*8*FW)
        pipes = [struct.unpack('<hBB', m.memory(syms['pipes']+i*4,4)) for i in range(NPIPES)]
        def horizontal(left, right):
            line = bytearray(FW)
            for x in range(max(PL*8,left), min(PR*8,right)):
                line[x//8-PL] |= 0x80 >> (x%8)
            return line
        for left_cell, gap, _ in pipes:
            left = left_cell*8-value('phase',1)*2
            body = horizontal(left+8,left+56)
            cap = horizontal(left,left+64)
            stripe = horizontal(left,left+1)
            edge = horizontal(left+63,left+64)
            stripe = bytes(a|b for a,b in zip(stripe,edge))
            for y in range(GROUND*8):
                row = y//8
                if gap <= row < gap+GAP: continue
                line = (stripe if y%8 == 1 else cap) if row in (gap-1,gap+GAP) else body
                offset = y*FW
                for x, bits in enumerate(line): expected[offset+x] |= bits
        bird_y = value('bird_y')//16
        bird_row = bird_y//8
        # The software sprite owns a 3x3 cell rectangle, including padding.
        wing = bird_art.WINGS[(0, 1, 2, 1)[((value('frame_count')-1) >> 2) & 3]]
        art = bird_art.rows_as_bytes(wing)
        for y in range(bird_row*8,min(GROUND*8,(bird_row+3)*8)):
            py = y-bird_y
            offset = y*FW+BX-PL
            expected[offset:offset+5] = bytes(art[py]) if 0 <= py < 12 else bytes(5)
        if actual != expected:
            i = next(i for i,(a,b) in enumerate(zip(actual,expected)) if a != b)
            x, y = PL+i%FW, i//FW
            raise AssertionError(f'pixel mismatch column {x}, y {y}: {actual[i]:02x}/{expected[i]:02x}; code {cells[(y//8)*80+x]}, phase {shift}, pipes {pipes}')

    def step(mask=0):
        held(mask)
        before = value('frame_count')
        m.next_frame()
        assert (value('frame_count') - before) & 65535 == 1
        verify()
    assert value('state', 1) == 0
    step()
    m.capture(f'build/flappy-{args.tag}-title.png')
    step(1)
    assert value('state', 1) == 1
    # Holding fire must not auto-flap; gravity progresses on every frame.
    step(1)
    v = value('velocity')
    step(1)
    assert value('velocity') == (v+2) & 65535
    step(0); step(1)
    assert value('velocity') == (-32 & 65535)
    # Pause freezes simulation and resumes without losing the run.
    step(2)
    assert value('state', 1) == 3
    frozen = (value('bird_y'), m.memory(syms['pipes'], 4*NPIPES))
    for _ in range(3): step()
    assert frozen == (value('bird_y'), m.memory(syms['pipes'], 4*NPIPES))
    step(2)
    assert value('state', 1) == 1
    print('PASS: title, start, edge-triggered flap, gravity and pause/resume')
    # Test-only stopwatch: cascade CIA2 timers at the machine's 1 MHz clock.
    # No timing instrumentation or autoplay is added to the shipped PRG.
    m.write(0xdd0e, b'\0\0', 3)
    m.write(0xdd04, b'\xff'*4, 3)
    m.write(0xdd0f, b'\x51', 3)
    m.write(0xdd0e, b'\x11', 3)
    def clock():
        return int.from_bytes(m.memory(0xdd04,4,3), 'little')
    previous_clock = clock()
    intervals = []
    phase_clocks = {0:[],1:[],2:[],3:[]}
    # Autopilot aims inside each approaching pipe gap using the real physics.
    for frame in range(args.flight_frames):
        pipes = [struct.unpack('<hBB', m.memory(syms['pipes']+i*4, 4)) for i in range(NPIPES)]
        upcoming = [p for p in pipes if p[0]*8-value('phase',1)*2+64 > BX*8]
        target = min(upcoming, key=lambda p:p[0])[1]*8 + 23
        y = value('bird_y')/16
        velocity = struct.unpack('<h', m.memory(syms['velocity'], 2))[0]
        mask = 1 if y > target and velocity >= 0 and not value('previous_keys',1) else 0
        step(mask)
        now = clock()
        elapsed = (previous_clock - now) & 0xffffffff
        intervals.append(elapsed)
        phase_clocks[value('phase',1)].append(elapsed)
        previous_clock = now
        assert value('state', 1) == 1, (frame, pipes, y, target)
        pixels()
        if frame == 190: m.capture(f'build/flappy-{args.tag}-play.png')
    assert value('score') >= 3, value('score')
    print(f'PASS: {args.flight_frames}-frame flight, pipe recycling, scoring, pipe/bird pixel model checked; max dirty {value("max_dirty")}', flush=True)
    hz = 1022727 if args.ntsc else 985248
    fps = len(intervals)*hz/sum(intervals)
    print(f'Active cadence: {fps:.3f} fps; frame clocks {min(intervals)}..{max(intervals)}', flush=True)
    buckets = [sum(lo <= n < hi for n in intervals) for lo,hi in ((0,25000),(25000,42000),(42000,58000),(58000,1000000))]
    print(f'Frame intervals (about 1/2/3/4+ refreshes): {buckets}', flush=True)
    print('By phase:', {p:(round(sum(v)/len(v)),max(v)) for p,v in phase_clocks.items()}, flush=True)
    step(2)
    for _ in range(3): step()
    m.capture(f'build/flappy-{args.tag}-stable.png')
    step(2)
    # Stop flapping and hit the floor or a pipe (then fall to the floor).
    for _ in range(200):
        step()
        if value('state',1) == 2: break
    assert value('state',1) == 2
    assert value('best') == value('score')
    m.capture(f'build/flappy-{args.tag}-gameover.png')
    for _ in range(31): step()
    step(1)
    assert value('state',1) == 1 and value('score') == 0 and value('best') >= 3
    print('PASS: death, high score and restart')
    # Skim just above each lower cap: the bird's cells then share the cap
    # rows the pipe prerender copies, and every flip must still show clean
    # screen and colour cells (verify() runs on every step).
    def pipes_now():
        return [struct.unpack('<hBB', m.memory(syms['pipes']+i*4, 4)) for i in range(NPIPES)]
    for frame in range(300):
        ph = value('phase', 1)
        nxt = min((p for p in pipes_now() if p[0]*8-ph*2+64 > BX*8), key=lambda p: p[0])
        target = ((nxt[1]+GAP)*8 - 13) * 16
        put('velocity', max(-32, min(32, target - value('bird_y'))) - 2)
        step()
        assert value('state', 1) == 1, ('crashed while skimming', frame)
        pixels()
    print('PASS: 300 frames skimming the lower caps, pages and pixel model clean')
    # Landing on a pipe during a character-boundary step flips pages in the
    # same frame as the death; game over must leave both pages clean.
    # Steer through velocity (at most 2 px per frame, as real play moves) to
    # hover just above the next lower cap, then drop onto it at the step.
    for _ in range(3000):
        ph = value('phase', 1)
        pipes = pipes_now()
        nxt = min((p for p in pipes if p[0]*8-ph*2+64 > BX*8), key=lambda p: p[0])
        over = nxt[0]*8-ph*2 < BX*8+40
        target = ((nxt[1]+GAP)*8 - 14) * 16
        y = value('bird_y')
        if over and ph == 3 and y == target:
            put('velocity', 48)
            step()
            break
        put('velocity', max(-32, min(32, target - y)) - 2)
        step()
    # The hit starts the fall (state 4) in the step frame; the panel follows.
    assert value('state', 1) == 4 and value('phase', 1) == 0 and value('stepped', 1)
    for _ in range(200):
        if value('state', 1) == 2: break
        step()
    assert value('state', 1) == 2
    for _ in range(4): step()
    for page_base in (0, 0x1000):
        assert m.memory(page_base, 2000, 10) == m.memory(syms['screen'], 2000), hex(page_base)
        assert m.memory(page_base+0x800, 2000, 10) == m.memory(syms['attr'], 2000), hex(page_base)
    for _ in range(27): step()
    step(1)
    assert value('state', 1) == 1
    print('PASS: pipe landing on a step frame leaves both pages clean')
    # The ceiling clamps position and cancels upward velocity without death.
    put('velocity', -2000)
    step()
    assert value('state',1) == 1 and value('bird_y') == 0
    assert value('velocity') == 0
    print('PASS: non-lethal ceiling clamping')
    m.cmd(0x13, struct.pack('<I', checkpoint))
    held(0)
    before = value('frame_count')
    start = time.monotonic()
    m.cmd(0xaa)
    time.sleep(2)
    after = value('frame_count')
    fps = ((after-before)&65535)/(time.monotonic()-start)
    print(f'Idle cadence: {fps:.2f} fps; total blank overruns: {value("blank_overruns")}; max dirty: {value("max_dirty")}')
    assert 55 < fps < 65
    held(16)
    for _ in range(30):
        m.cmd(0xaa)
        if not m.memory(0xd030,1,3)[0] & 1:
            break
    restored_font = m.memory(0x2000, 240*16, 10)
    assert restored_font == original_font, ([(i,a,b) for i,(a,b) in enumerate(zip(restored_font,original_font)) if a != b][:8], m.memory(0xd030,1,3)[0], value('frame_count'), m.memory(key_addr,3))
    for reg in list(range(10)) + [12,13,20,21,22,23,24,25,27,28,34]:
        assert m.vdc_register(reg) == saved_regs[reg], reg
    assert not m.memory(0xd030,1,3)[0] & 1
    print('PASS: quit restores font, display registers and CPU speed')


def _find_calls(m, syms):
    """Locate the main-loop JSRs that invoke each phase routine.

    Checkpointing a function *entry* is unreliable for ``wait_frame`` because
    its entry label (``wait_frame.l4``) is the top of a tight ``bit/and/bne``
    poll loop, so a checkpoint there re-triggers and starves every later
    checkpoint. The *call sites* in ``main`` are straight-line addresses that
    each execute exactly once per frame, so a checkpoint on each yields a clean
    ``prepare -> sound -> stage -> wait -> show`` cycle.

    A routine may be called more than once, so we do not simply take the first
    JSR. Instead we locate the contiguous cluster in which the five calls appear
    in the loop order ``prepare < sound < stage < wait < show`` with no stray
    JSR to another routine in between -- init code calls the same routines, but
    never in that exact sequence.
    """
    base = syms['main']
    window = m.memory(base, 0x800)
    sites = {name: [] for name in
             ('prepare_frame', 'sound_tick', 'wait_frame', 'show_frame', 'stage_frame')}
    for i in range(0, len(window) - 2):
        if window[i] != 0x20:
            continue
        target = window[i+1] | (window[i+2] << 8)
        for name, addr in syms.items():
            if addr == target and name in sites:
                sites[name].append(base + i)
    order = ('prepare_frame', 'sound_tick', 'stage_frame', 'wait_frame', 'show_frame')
    # Find a run where each routine's call follows the previous one, all within
    # a tight window (the loop body is < 32 bytes).
    for start in sites['prepare_frame']:
        run = [start]
        for prev, name in zip(order, order[1:]):
            nxt = [a for a in sites[name] if a > run[-1] and a - run[-1] <= 16]
            if not nxt:
                break
            run.append(min(nxt))
        if len(run) == len(order):
            return dict(zip(order, run))
    raise RuntimeError('could not locate the main-loop phase call sites')


def profile_phases(m, syms, frames=200, flight=False):
    """Separate the per-frame cost into prepare / sound / stage / wait / show.

    Uses the same cascade CIA2 stopwatch as check_game, but samples the clock
    at every main-loop call site instead of once per frame. Each measured
    interval is [call site N .. call site N+1], so:

      prepare -> sound   = prepare_frame cost
      sound   -> stage   = sound_tick cost
      stage   -> wait    = stage_frame cost (VDC writes to the hidden page)
      wait    -> show    = wait_frame cost (idle until vertical blank)
      show    -> prepare = show_frame (page flip) + keys + loop overhead

    Worst-case (max) matters as much as the average here: it is the frame that
    risks overrunning the VDC's vertical blank window. With ``flight`` the run
    starts a game and alternates flap/release, retrying after each crash, so
    the sample covers active-play frames (moving pipes, full dirty-cell churn)
    rather than the title screen. Active-play prepare and stage costs are
    also reported per pipe phase.
    """
    keys_cp = m.checkpoint(syms['keys'])
    m.next_frame()
    # Cascade timer B under A for a 32-bit free-running clock at 1 MHz.
    m.write(0xdd0e, b'\0\0', 3)
    m.write(0xdd04, b'\xff'*4, 3)
    m.write(0xdd0f, b'\x51', 3)
    m.write(0xdd0e, b'\x11', 3)
    start = int.from_bytes(m.memory(0xdd04, 4, 3), 'little')
    def clock():
        return (start - int.from_bytes(m.memory(0xdd04, 4, 3), 'little')) & 0xffffffff
    # Patch the input routine: hold no key (title) or hold flap (active game).
    m.write(syms['keys'], bytes([0xa9, 1 if flight else 0, 0x60]))
    if flight:
        m.next_frame()                       # let the start edge register
    sites = _find_calls(m, syms)
    # Now that the autopilot is patched in, drop its checkpoint and measure
    # only the five consecutive main-loop call sites.
    m.cmd(0x13, struct.pack('<I', keys_cp))
    order = [('prepare', sites['prepare_frame']),
             ('sound', sites['sound_tick']),
             ('stage', sites['stage_frame']),
             ('wait', sites['wait_frame']),
             ('show', sites['show_frame'])]
    cps = {addr: m.checkpoint(addr) for _, addr in order}
    by_addr = {addr: name for name, addr in order}
    samples = {name: [] for name, _ in order}
    # Active play only, keyed by the pipe phase the frame prepared.
    by_phase = {(name, ph): [] for name in ('prepare', 'stage', 'wait', 'show') for ph in range(4)}
    flap = 0
    m.to_checkpoint(*cps.values())           # align to a call site
    prev = clock()
    prev_name = '?'
    guard = frames * len(order) + 100
    for _ in range(guard):
        addr = m.to_checkpoint(*cps.values())
        now = clock()
        name = by_addr[addr]
        if prev_name != '?':
            elapsed = (now - prev) & 0xffffffff
            samples[prev_name].append(elapsed)
            if (prev_name, 0) in by_phase and m.memory(syms['state'], 1)[0] == 1:
                by_phase[prev_name, m.memory(syms['phase'], 1)[0]].append(elapsed)
        if flight and name == 'show':
            # Alternate flap/release so play continues through deaths and
            # retries instead of ending on the first crash.
            flap ^= 1
            m.write(syms['keys'], bytes([0xa9, flap, 0x60]))
        prev, prev_name = now, name
        if all(len(v) >= frames for v in samples.values()):
            break
    for _, cp in cps.items():
        m.cmd(0x13, struct.pack('<I', cp))
    print(f'Per-phase CPU clocks over ~{frames} frames (1 MHz cascade timer):')
    print( '  interval                    avg      min      max     n')
    for name, _ in order:
        v = samples[name]
        if not v:
            print(f'  {name:8s} (no samples)')
            continue
        print(f'  {name:8s} {sum(v)/len(v):9.0f} {min(v):8d} {max(v):8d} {len(v):6d}')
    if flight:
        print('  active play by pipe phase (median/avg/max/n; retries inflate max):')
        for (name, ph), v in by_phase.items():
            if v:
                print(f'  {name:8s} phase {ph} {sorted(v)[len(v)//2]:8d} '
                      f'{sum(v)/len(v):9.0f} {max(v):8d} {len(v):6d}')
    print(f'  dirty max {int.from_bytes(m.memory(syms["max_dirty"],2),"little")}'
          f'  blank overruns {int.from_bytes(m.memory(syms["blank_overruns"],2),"little")}')


def check_vdc_memory(m, syms):
    """Read through the VDC data port, including on physical 16 KB models.

    Monitor bank reads alone can expose backing storage instead of the
    address mapping used by the emulated VDC.
    """
    m.checkpoint(syms['keys'])
    m.next_frame()
    m.write(syms['keys'], bytes([0xa9, 0, 0x60]))
    for _ in range(3):
        m.next_frame()
    shapes = m.memory(syms['shapes'], 240 * 8)
    mismatches = 0
    for phase in range(4):
        base = 0x2000 * (phase + 1)
        bad = 0
        # Phase-dependent pipe edge plus static HUD, text and panel glyphs.
        for glyph in (10, 17, 70, 128, 154, 239):
            for row in range(8):
                expected = shapes[glyph * 8 + row]
                if glyph == 10:
                    expected = sum(0x80 >> pixel for pixel in range(8)
                                   if 8 <= pixel + phase * 2 < 56)
                bad += m.vdc_byte(base + glyph * 16 + row) != expected
        mismatches += bad
        print(f'Font ${base:04X}: {bad}/48 sampled bytes differ', flush=True)
    m.capture(f'build/flappy-{args.tag}-memory.png')
    print(f'{args.ram} KB VDC: {mismatches}/192 sampled font bytes differ', flush=True)
    if args.ram == 64:
        assert mismatches == 0, '64 KB font banks failed verification'
    else:
        assert mismatches > 0, '16 KB unexpectedly retained all sampled banks'


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--ntsc', action='store_true')
    parser.add_argument('--ram', choices=(16, 64), type=int, default=64)
    parser.add_argument('--memory-only', action='store_true',
                        help='sample all four font banks through the VDC data port')
    parser.add_argument('--profile', metavar='N', type=int,
                        help='measure per-phase CPU clocks over N frames and exit')
    parser.add_argument('--profile-flight', action='store_true',
                        help='with --profile, start a game so active-play frames are sampled')
    parser.add_argument('--port', type=int, default=6513)
    parser.add_argument('--flight-frames', type=int, default=500)
    args = parser.parse_args()
    if args.ram == 16 and not args.memory_only:
        parser.error('16 KB is only supported for the --memory-only diagnostic')
    args.tag = f'{"ntsc" if args.ntsc else "pal"}-{args.ram}k'
    syms = {line.split()[2].lstrip('.'): int(line.split()[1],16)
            for line in Path('build/flappy.lbl').read_text().splitlines()}
    logpath = Path(f'build/vice-{args.tag}.log')
    with logpath.open('w') as log:
        p = subprocess.Popen(['x128', '-console', '-default', '-80col',
            '-ntsc' if args.ntsc else '-pal', f'-VDC{args.ram}KB',
            '-sounddev', 'dummy', '-binarymonitor', '-binarymonitoraddress',
            f'127.0.0.1:{args.port}', '-autostartprgmode', '1',
            '-autostart', 'build/flappy.prg'], stdout=log, stderr=log)
        m = None
        try:
            deadline = time.monotonic()+20
            while m is None:
                if p.poll() is not None:
                    raise RuntimeError(logpath.read_text())
                assert time.monotonic() < deadline, 'Monitor startup timed out'
                try:
                    m = Monitor(args.port)
                except ConnectionRefusedError:
                    time.sleep(0.1)
            if args.memory_only:
                check_vdc_memory(m, syms)
            elif args.profile:
                profile_phases(m, syms, args.profile, flight=args.profile_flight)
            else:
                check_game(m, syms)
        finally:
            if m:
                try:
                    m.cmd(0xbb)
                except (EOFError, OSError):
                    pass
                m.s.close()
            try:
                p.wait(timeout=3)
            except subprocess.TimeoutExpired:
                p.terminate()
                p.wait(timeout=3)
