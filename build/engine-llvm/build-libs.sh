#!/bin/sh

#
# Here, we build the LLVM bitcode libraries, libz.z, libpng.z, libogg.a, libvorbis.a and libfreetype.a.
#

set -eu

PREFIX=`pwd`/libroot

rm -rf tmp libroot
mkdir -p tmp libroot libroot/include libroot/lib

cd tmp

echo 'Building zlib...'
tar xzf ../../libsrc/zlib-1.3.1.tar.gz
cd zlib-1.3.1
llvm-gcc -c -emit-llvm adler32.c
llvm-gcc -c -emit-llvm infback.c
llvm-gcc -c -emit-llvm trees.c
llvm-gcc -c -emit-llvm compress.c
llvm-gcc -c -emit-llvm inffast.c
llvm-gcc -c -emit-llvm uncompr.c
llvm-gcc -c -emit-llvm crc32.c
llvm-gcc -c -emit-llvm inflate.c
llvm-gcc -c -emit-llvm deflate.c
llvm-gcc -c -emit-llvm inftrees.c
llvm-ar rcs libz.a adler32.bc infback.bc trees.bc compress.bc inffast.bc uncompr.bc crc32.bc inflate.bc deflate.bc inftrees.bc
cp zlib.h zconf.h ../../libroot/include/
cp libz.a ../../libroot/lib/
cd ..

echo 'Building libpng...'
tar xzf ../../libsrc/libpng-1.6.43.tar.gz
cd libpng-1.6.43
cp scripts/pnglibconf.h.prebuilt pnglibconf.h
llvm-gcc -DHAVE_CONFIG_H -I. -I../../libroot/include -g -O2 -c -emit-llvm contrib/tools/pngfix.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm png.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngset.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngwtran.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm png.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngread.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngerror.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngrio.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngtrans.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngget.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngrtran.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngwio.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngmem.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngrutil.c
llvm-gcc -I. -I../../libroot/include -O2 -c -emit-llvm pngwrite.c
llvm-ar rcs libpng.a pngfix.bc png.bc pngset.bc pngwtran.bc png.bc pngread.bc pngerror.bc pngrio.bc pngtrans.bc pngget.bc pngrtran.bc pngwio.bc pngmem.bc pngrutil.bc pngwrite.bc
cp png.h pngconf.h pnglibconf.h ../../libroot/include
cp libpng.a ../../libroot/lib
cd ..

echo 'Building libogg...'
tar xzf ../../libsrc/libogg-1.3.3.tar.gz
cd libogg-1.3.3
#./configure --prefix=$PREFIX --enable-static --disable-shared --host=aarch64-none-elf CFLAGS="-O3 -ffunction-sections -fdata-sections" LDFLAGS="" CC=aarch64-none-elf-gcc
llvm-gcc -Iinclude -O2 -c -emit-llvm src/bitwise.c
llvm-gcc -Iinclude -O2 -c -emit-llvm src/framing.c
llvm-ar rcs libogg.a bitwise.bc framing.bc
cp -R include/ogg ../../libroot/include
cp libogg.a ../../libroot/lib
cd ..

echo 'Building libvorbis...'
tar xzf ../../libsrc/libvorbis-1.3.6.tar.gz
cd libvorbis-1.3.6
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/analysis.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/mdct.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/barkmel.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/psy.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/bitrate.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/block.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/registry.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/codebook.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/res0.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/envelope.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/sharedbook.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/floor0.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/smallft.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/floor1.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/synthesis.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/info.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/tone.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/lookup.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include -Ilib lib/vorbisenc.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/lpc.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/vorbisfile.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/lsp.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/window.c
llvm-gcc -Iinclude -O2 -c -emit-llvm -I../../libroot/include lib/mapping0.c
llvm-ar rcs libvorbis.a analysis.bc mdct.bc barkmel.bc psy.bc bitrate.bc block.bc registry.bc codebook.bc res0.bc envelope.bc sharedbook.bc floor0.bc smallft.bc floor1.bc synthesis.bc info.bc tone.bc lookup.bc vorbisenc.bc lpc.bc vorbisfile.bc lsp.bc window.bc mapping0.bc
cp -R include/vorbis ../../libroot/include
cp libvorbis.a ../../libroot/lib
cd ..

echo 'Building freetype2...'
tar xzf ../../libsrc/freetype-2.13.2.tar.gz
cd freetype-2.13.2
sed -e 's/FONT_MODULES += type1//' \
    -e 's/FONT_MODULES += cid//' \
    -e 's/FONT_MODULES += pfr//' \
    -e 's/FONT_MODULES += type42//' \
    -e 's/FONT_MODULES += pcf//' \
    -e 's/FONT_MODULES += bdf//' \
    -e 's/FONT_MODULES += pshinter//' \
    -e 's/FONT_MODULES += raster//' \
    -e 's/FONT_MODULES += psaux//' \
    -e 's/FONT_MODULES += psnames//' \
    < modules.cfg > modules.cfg.new
mv modules.cfg.new modules.cfg
# Add |tee for avoid freeze on Emacs shell.
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftdebug.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftinit.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftbase.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftbbox.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftbdf.c 
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftbitmap.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftcid.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftfstype.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftgasp.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftglyph.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftgxval.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftmm.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftotval.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftpatent.c 
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftpfr.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftstroke.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftsynth.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/fttype1.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/base/ftwinfnt.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/truetype/truetype.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/cff/cff.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/winfonts/winfnt.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/sfnt/sfnt.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/autofit/autofit.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/pshinter/pshinter.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/smooth/smooth.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/raster/raster.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/svg/svg.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/sdf/sdf.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/cache/ftcache.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/gzip/ftgzip.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/lzw/ftlzw.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/bzip2/ftbzip2.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/psaux/psaux.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/psnames/psnames.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/psnames/psnames.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/dlg/dlgwrap.c
llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../../libroot/include -DFT2_BUILD_LIBRARY src/tools/apinames.c
llvm-ar rcs libfreetype.a ftdebug.bc ftinit.bc ftbase.bc ftbbox.bc ftbdf.bc ftbitmap.bc ftcid.bc ftfstype.bc ftgasp.bc ftglyph.bc ftgxval.bc ftmm.bc ftotval.bc ftpatent.bc ftpfr.bc ftstroke.bc ftsynth.bc fttype1.bc ftwinfnt.bc truetype.bc cff.bc winfnt.bc sfnt.bc autofit.bc pshinter.bc smooth.bc raster.bc svg.bc sdf.bc ftcache.bc ftgzip.bc ftlzw.bc ftbzip2.bc psaux.bc psnames.bc psnames.bc dlgwrap.bc apinames.bc
cp include/ft2build.h ../../libroot/include
cp -R include/freetype ../../libroot/include
cp libfreetype.a ../../libroot/lib
cd ..

cd ..

echo 'Finished.'
