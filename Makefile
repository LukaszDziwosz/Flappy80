OSCAR64 ?= $(shell command -v oscar64 2>/dev/null)
ifeq ($(strip $(OSCAR64)),)
OSCAR64 := $(HOME)/Desktop/80Terminal/.tools/oscar64/bin/oscar64
endif
VICE ?= x128

.PHONY: all run test lab run-lab bench run-bench clean

all: build/flappy.prg

build/flappy.prg: src/flappy.c src/hw.h src/sound.h src/sound.c
	mkdir -p build
	"$(OSCAR64)" -tm=c128e -O2 -n -dNOFLOAT -o=$@ src/flappy.c

lab: build/birdlab.prg

build/birdlab.prg: src/flappy.c src/hw.h src/sound.h src/sound.c
	mkdir -p build
	"$(OSCAR64)" -tm=c128e -O2 -n -dNOFLOAT -dBIRDLAB -o=$@ src/flappy.c

run-lab: build/birdlab.prg
	$(VICE) -VDC64KB -80col -autostartprgmode 1 -autostart $<

bench: build/vdcbench.prg

build/vdcbench.prg: bench/vdcbench.c src/hw.h
	mkdir -p build
	"$(OSCAR64)" -tm=c128e -O2 -n -o=$@ bench/vdcbench.c

run-bench: build/vdcbench.prg
	$(VICE) -VDC64KB -80col -autostartprgmode 1 -autostart $<

run: build/flappy.prg
	$(VICE) -VDC64KB -80col -autostartprgmode 1 -autostart $<

test: build/flappy.prg
	python3 -B tests/vice_flappy.py --ram 64
	python3 -B tests/vice_flappy.py --ntsc --ram 64

clean:
	rm -f build/birdlab.prg build/vdcbench.prg build/flappy.prg build/flappy.asm build/flappy.int build/flappy.lbl build/flappy.map
