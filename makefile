# Simple top-level makefile to call all of the children at once.

all: 
	cd photon-firmware && make
	cd demos/forum-browser && make
	cd demos/hello-world && make
	cd demos/character-movement && make
	cd demos/all-request-types && make
