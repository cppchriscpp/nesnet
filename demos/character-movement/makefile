# This attempts to build the game for you. 
# Note: This is a pretty poor excuse for a makefile. I'd look elsewhere for better examples. 
# Prequisites:
# - A few fairly standard unix applications available; Gow/Cygwin installed for Windows.
# - ca65 binaries in the tools folder

### USER EDITABLE STUFF STARTS HERE

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

MAIN_COMPILER=./tools/cc65/bin/cc65
MAIN_ASM_COMPILER=./tools/cc65/bin/ca65
MAIN_LINKER=./tools/cc65/bin/ld65
SPLITTER=tools/readnes3/readnes3
MAIN_EMULATOR=tools/fceux/fceux
DEBUG_EMULATOR=tools/nintendulatordx/nintendulator
SPACE_CHECKER=tools/nessc/nessc
CONFIG_FILE=$(ROOT_DIR)/cfg/game.cfg
TEXT2DATA=sound/text2data
NSF2DATA=sound/nsf2data
VERSION=0.1

### USER EDITABLE STUFF ENDS HERE

all: world.s lib/crt0.o world.o world.nes

world.s: world.c 
	$(MAIN_COMPILER) -Oi world.c --add-source --include-dir ./tools/cc65/include
	
lib/crt0.o: lib/crt0.asm ../../src/nesnet.asm ../../src/nesnet.h
	$(MAIN_ASM_COMPILER) lib/crt0.asm

world.o: world.s
	$(MAIN_ASM_COMPILER) world.s

world.nes: lib/crt0.o world.o 
	$(MAIN_LINKER) -C $(CONFIG_FILE) -o world.nes lib/crt0.o world.o lib/runtime.lib

fceux:
	$(MAIN_EMULATOR) world.nes
	
run: fceux

nintendulator:
	$(DEBUG_EMULATOR) world.nes

space_check:
	$(SPACE_CHECKER) world.nes

clean:
	-rm -f *.nes
	-rm -f *.o
	-rm -f lib/*.o
	-rm -f world.s