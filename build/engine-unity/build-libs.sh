#!/bin/sh

set -eu

ARCH=$1
CC=$2
AR=$3

PREFIX=`pwd`/libroot-$ARCH

rm -rf tmp libroot-$ARCH
mkdir -p tmp libroot-$ARCH
mkdir -p libroot-$ARCH/include libroot-$ARCH/lib

cd tmp

echo 'Building brotli...'
tar xzf ../../libsrc/brotli-1.1.0.tar.gz
cp ../Makefile.brotli brotli-1.1.0/Makefile
cd brotli-1.1.0
make TARGET=libroot-$ARCH CC=$CC AR=$AR
cd ..

echo 'Building bzip2...'
tar xzf ../../libsrc/bzip2-1.0.6.tar.gz
cd bzip2-1.0.6
make libbz2.a PREFIX=$ARCH- CFLAGS='-O3 -ffunction-sections -fdata-sections' CC=$CC
cp bzlib.h ../../libroot-$ARCH/include/
cp libbz2.a ../../libroot-$ARCH/lib/
cd ..

#echo 'Building libwebp...'
#tar xzf ../../libsrc/libwebp-1.3.2.tar.gz
#cd libwebp-1.3.2
#./configure --prefix=$PREFIX --enable-static --disable-shared --disable-threading --host=$ARCH CPPFLAGS=-I$PREFIX/include CFLAGS="-O3 -ffunction-sections -fdata-sections -no-pthread" LDFLAGS="-L$PREFIX/lib -no-pthread" CC=$CC
#make
#make install
#cd ..

echo 'Building zlib...'
tar xzf ../../libsrc/zlib-1.2.11.tar.gz
cd zlib-1.2.11
make libz.a -f win32/Makefile.gcc PREFIX=$ARCH- CFLAGS="-O3 -ffunction-sections -fdata-sections" LDFLAGS=""
cp zlib.h zconf.h ../../libroot-$ARCH/include/
cp libz.a ../../libroot-$ARCH/lib/
cd ..

echo 'Building libpng...'
tar xzf ../../libsrc/libpng-1.6.43.tar.gz
cd libpng-1.6.43
./configure --prefix=$PREFIX --enable-static --disable-shared --host=$ARCH CPPFLAGS=-I$PREFIX/include CFLAGS="-O3 -ffunction-sections -fdata-sections" LDFLAGS="-L$PREFIX/lib" CC=$CC
make
make install
cd ..

echo 'Building jpeg9...'
tar xzf ../../libsrc/jpegsrc.v9e.tar.gz
cd jpeg-9e
./configure --prefix=$PREFIX --enable-static --disable-shared --host=$ARCH CPPFLAGS=-I$PREFIX/include CFLAGS="-O3 -ffunction-sections -fdata-sections" LDFLAGS="-L$PREFIX/lib" CC=$CC
make
make install
cd ..

echo 'Building libogg...'
tar xzf ../../libsrc/libogg-1.3.3.tar.gz
cd libogg-1.3.3
./configure --prefix=$PREFIX --enable-static --disable-shared --host=$ARCH CFLAGS="-O3 -ffunction-sections -fdata-sections" LDFLAGS="" CC=$CC
make
make install
cd ..

echo 'Building libvorbis...'
tar xzf ../../libsrc/libvorbis-1.3.6.tar.gz
cd libvorbis-1.3.6
./configure --prefix=$PREFIX --enable-static --disable-shared --host=$ARCH PKG_CONFIG="" --with-ogg-includes=$PREFIX/include --with-ogg-libraries=$PREFIX/lib CFLAGS='-O3 -ffunction-sections -fdata-sections' LDFLAGS="" CC=$CC
make
make install
cd ..

echo 'Building freetyp2...'
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
./configure --prefix=$PREFIX --enable-static --disable-shared --host=$ARCH --with-png=yes --with-harfbuzz=no --with-zlib=yes --with-bzip2=yes --with-brotli=yes CFLAGS="-O3 -ffunction-sections -fdata-sections -fPIC" LDFLAGS="" ZLIB_CFLAGS="-I../../libroot-$ARCH/include" ZLIB_LIBS="-L../../libroot-$ARCH/lib -lz" BZIP2_CFLAGS="-I../../libroot-$ARCH/include" BZIP2_LIBS="-L../../libroot-$ARCH/lib -lbz2" LIBPNG_CFLAGS="-I../../libroot-$ARCH/include" LIBPNG_LIBS="-L../../libroot-$ARCH/lib -lpng" BROTLI_CFLAGS="-I../../libroot-$ARCH/include" BROTLI_LIBS="-L../../libroot-$ARCH/lib -lpng" CC=$CC | tee
make | tee
make install | tee
cd ..

cd ..
#rm -rf tmp

echo 'Finished.'
