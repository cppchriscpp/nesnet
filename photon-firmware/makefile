# This will build and optionally deploy your photon changes for you.
# Prequisites:
# - Particle npm module installed at the global level (And logged in)
# - Photon device named 'hamster_nes' (Or update the line below)

### USER EDITABLE STUFF STARTS HERE

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
PHOTON_NAME=hamster_nes 

COMMAND=particle

### USER EDITABLE STUFF ENDS HERE

all: bin/photon_firmware.bin

bin/photon_firmware.bin: nesnet.ino
	$(COMMAND) compile photon . --saveTo bin/photon_firmware.bin
	
flash:
	$(COMMAND) flash $(PHOTON_NAME) "bin/photon_firmware.bin"

clean:
	-rm -f bin/*.bin