include ../common.mk

#
# Toolchain
#

CC = ./llvm/bin/aarch64-w64-mingw32-gcc
CXX = ./llvm/bin/aarch64-w64-mingw32-g++
WINDRES = ./llvm/bin/aarch64-w64-mingw32-windres

#
# CPPFLAGS
#

CPPFLAGS = \
	-I./llvm/aarch64-w64-mingw32/include \
	-I. \
	-I./libroot/include \
	-I./libroot/include/freetype2

#
# CFLAGS
#

CFLAGS = \
	-O3 \
	-municode \
	-ffast-math \
	-finput-charset=utf-8 \
	-fexec-charset=utf-8 \
	-Wall \
	-Werror \
	-Wextra \
	-Wundef \
	-Wconversion \
	-Wno-multichar

#
# LDFLAGS
#

LDFLAGS = \
	-mwindows \
	-municode \
	-lgdi32 \
	-lole32 \
	-ldxguid \
	-ldsound \
	-ld3d9 \
	-lstrmiids \
	-lsapi \
	-L./libroot/lib \
	-Wl,-dn,-lpng16,-ljpeg,-lwebp,-lfreetype,-lz,-lbz2,-lvorbisfile,-lvorbis,-logg,-dy \
	-Wl,--gc-sections

#
# Source files
#

SRCS_C = \
	../../src/microsoft/winmain.c \
	../../src/microsoft/dsound.c

SRCS_CC = \
	../../src/microsoft/dx9render.cc \
	../../src/microsoft/dsvideo.cc \
	../../src/microsoft/tts_sapi.cc

SRCS_R = resource.rc

HDRS = \
	../../src/microsoft/dsound.h \
	../../src/microsoft/dx9render.h \
	../../src/microsoft/dsvideo.h \
	../../src/microsoft/tts_sapi.h

#
# .c.o compilation rules
#

OBJS = \
	$(SRCS_MAIN:../../src/%.c=%.o) \
	$(SRCS_C:../../src/microsoft/%.c=%.o) \
	$(SRCS_CC:../../src/microsoft/%.cc=%.o) \
	$(SRCS_R:%.rc=%.o)

%.o: ../../src/microsoft/%.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $<

%.o: ../../src/khronos/%.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $<

%.o: ../../src/microsoft/%.cc
	$(CXX) -c $(CPPFLAGS) $(CFLAGS) $(CXXFLAGS) $<

%.o: ../../src/%.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) $<

%.o: %.rc
	$(WINDRES) $< $@

#
# Target
#

all: game-arm64.exe

game-arm64.exe: libroot $(OBJS) $(HDRS_MAIN) $(HDRS)
	$(CC) -s -o game-arm64.exe $(OBJS) $(LDFLAGS)

libroot:
	./build-libs.sh

#
# Phony
#

install: game-arm64.exe
	cp game-arm64.exe ../../

clean:
	rm -rf *.o *~ game-arm64.exe log.txt sav tmp

erase:
	rm -rf *.o *~ game-arm64.exe log.txt sav tmp libroot llvm
