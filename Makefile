.PHONY: all

all: build/src/openocd

build/src/openocd:
	cd openocd && \
		./bootstrap
	mkdir -p build && cd build && \
		../openocd/configure && \
		make -j

run-openocd-orange-pi-zero-3: build/src/openocd
		build/src/openocd -f config/interface/ft2232h.cfg -f config/board/orange_pi_zero_3.cfg

console:
		tio /dev/ttyUSB1
