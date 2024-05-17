CFLAGS = -arch arm64

all: polaris

polaris: libpng libogg libvorbis freetype2
	@mkdir -p bitcode
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/anime.c -o bitcode/anime.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/conf.c -o bitcode/conf.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/ciel.c -o bitcode/ciel.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/event.c -o bitcode/event.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/glyph.c -o bitcode/glyph.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/gui.c -o bitcode/gui.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/halwrap.c -o bitcode/halwrap.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/history.c -o bitcode/history.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/image.c -o bitcode/image.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/log.c -o bitcode/log.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/main.c -o bitcode/main.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/mixer.c -o bitcode/mixer.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/readimage.c -o bitcode/readimage.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/readpng.c -o bitcode/readpng.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/save.c -o bitcode/save.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/scbuf.c -o bitcode/scbuf.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/script.c -o bitcode/script.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/seen.c -o bitcode/seen.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/stage.c -o bitcode/stage.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/vars.c -o bitcode/vars.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/wave.c -o bitcode/wave.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/wms_core.c -o bitcode/wms_core.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/wms_lexer.yy.c -o bitcode/wms_lexer.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/wms_parser.tab.c -o bitcode/wms_parser.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/wms_impl.c -o bitcode/wms_impl.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_anime.c -o bitcode/cmd_anime.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_bg.c -o bitcode/cmd_bg.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_bgm.c -o bitcode/cmd_bgm.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_ch.c -o bitcode/cmd_ch.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_cha.c -o bitcode/cmd_cha.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_chapter.c -o bitcode/cmd_chapter.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_chs.c -o bitcode/cmd_chs.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_click.c -o bitcode/cmd_click.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_gosub.c -o bitcode/cmd_gosub.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_goto.c -o bitcode/cmd_goto.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_gui.c -o bitcode/cmd_gui.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_if.c -o bitcode/cmd_if.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_layer.c -o bitcode/cmd_layer.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_load.c -o bitcode/cmd_load.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_message.c -o bitcode/cmd_message.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_pencil.c -o bitcode/cmd_pencil.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_return.c -o bitcode/cmd_return.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_se.c -o bitcode/cmd_se.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_set.c -o bitcode/cmd_set.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_setconfig.c -o bitcode/cmd_setconfig.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_setsave.c -o bitcode/cmd_setsave.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_shake.c -o bitcode/cmd_shake.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_skip.c -o bitcode/cmd_skip.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_switch.c -o bitcode/cmd_switch.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_video.c -o bitcode/cmd_video.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_vol.c -o bitcode/cmd_vol.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_wait.c -o bitcode/cmd_wait.bc
	llvm-gcc -c -emit-llvm $(CFLAGS) -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Iinclude -Iinclude/freetype ../../src/cmd_wms.c -o bitcode/cmd_wms.bc

libpng: zlib
	@echo 'Building libpng...'
	@mkdir -p bitcode include
	@tar xzf ../libsrc/libpng-1.6.43.tar.gz
	@mv libpng-1.6.43 libpng
	@cd libpng && \
	cp scripts/pnglibconf.h.prebuilt pnglibconf.h && \
	llvm-gcc -DHAVE_CONFIG_H -I. -I../include -g $(CFLAGS) -O2 -c -emit-llvm contrib/tools/pngfix.c -o ../bitcode/pngfix.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm png.c -o ../bitcode/png.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngset.c -o ../bitcode/pngset.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngwtran.c -o ../bitcode/pngwtran.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngread.c -o ../bitcode/pngread.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngerror.c -o ../bitcode/pngerror.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngrio.c -o ../bitcode/pngrio.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngtrans.c -o ../bitcode/pngtrans.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngget.c -o ../bitcode/pngget.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngrtran.c -o ../bitcode/pngrtran.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngwio.c -o ../bitcode/pngwio.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngmem.c -o ../bitcode/pngmem.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngrutil.c -o ../bitcode/pngrutil.bc && \
	llvm-gcc -I. -I../include $(CFLAGS) -O2 -c -emit-llvm pngwrite.c -o ../bitcode/pngwrite.bc && \
	cp png.h pngconf.h pnglibconf.h ../include/ && \
	cd ..
	@rm -rf libpng

zlib:
	@echo 'Building zlib...'
	@mkdir -p bitcode include
	@tar xzf ../libsrc/zlib-1.2.11.tar.gz
	@mv zlib-1.2.11 zlib
	@cd zlib && \
	llvm-gcc -std=gnu89 -c -emit-llvm adler32.c -o ../bitcode/adler32.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm infback.c -o ../bitcode/infback.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm trees.c -o ../bitcode/trees.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm compress.c -o ../bitcode/compress.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm inffast.c -o ../bitcode/inffast.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm uncompr.c -o ../bitcode/uncompr.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm crc32.c -o ../bitcode/crc32.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm inflate.c -o ../bitcode/inflate.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm deflate.c -o ../bitcode/deflate.bc && \
	llvm-gcc -std=gnu89 -c -emit-llvm inftrees.c -o ../bitcode/inftrees.bc && \
	cp zlib.h zconf.h ../include/ && \
	cd ..
	@rm -rf zlib

libvorbis: libogg
	@echo 'Building libvorbis...'
	@mkdir -p bitcode include
	@tar xzf ../libsrc/libvorbis-1.3.6.tar.gz
	@mv libvorbis-1.3.6 libvorbis
	@cd libvorbis && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/analysis.c -o ../bitcode/analysis.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/mdct.c -o ../bitcode/mdct.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/barkmel.c -o ../bitcode/barkmel.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/psy.c -o ../bitcode/psy.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/bitrate.c -o ../bitcode/bitrate.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/block.c -o ../bitcode/block.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/registry.c -o ../bitcode/registry.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/codebook.c -o ../bitcode/codebook.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/res0.c -o ../bitcode/res0.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/envelope.c -o ../bitcode/envelope.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/sharedbook.c -o ../bitcode/sharedbook.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/floor0.c -o ../bitcode/floor0.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/smallft.c -o ../bitcode/smallft.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/floor1.c -o ../bitcode/floor1.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/synthesis.c -o ../bitcode/synthesis.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/info.c -o ../bitcode/info.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/tone.c -o ../bitcode/tone.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/lookup.c -o ../bitcode/lookup.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include -Ilib lib/vorbisenc.c -o ../bitcode/vorbisenc.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/lpc.c -o ../bitcode/lpc.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/vorbisfile.c -o ../bitcode/vorbisfile.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/lsp.c -o ../bitcode/lsp.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/window.c -o ../bitcode/window.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm -I../include lib/mapping0.c -o ../bitcode/mapping0.bc && \
	cp -R include/vorbis ../include/ && \
	cd ..
	@rm -rf libvorbis

libogg:
	@echo 'Building libogg...'
	@mkdir -p bitcode include
	@tar xzf ../libsrc/libogg-1.3.3.tar.gz
	@mv libogg-1.3.3 libogg
	@cd libogg && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm src/bitwise.c -o ../bitcode/bitwise.bc && \
	llvm-gcc -Iinclude $(CFLAGS) -O2 -c -emit-llvm src/framing.c -o ../bitcode/framing.bc && \
	cp -R include/ogg ../include/ && \
	cd ..
	@rm -rf libogg

freetype2:
	@echo 'Building freetype2...'
	@mkdir -p bitcode include
	@tar xzf ../libsrc/freetype-2.13.2.tar.gz
	@mv freetype-2.13.2 freetype
	@cd freetype && \
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
	    < modules.cfg > modules.cfg.new && \
	mv modules.cfg.new modules.cfg && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftdebug.c -o ../bitcode/ftdebug.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftinit.c -o ../bitcode/ftinit.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftbase.c -o ../bitcode/ftbase.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftbbox.c -o ../bitcode/ftbbox.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftbdf.c -o ../bitcode/ftbdf.bc  && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftbitmap.c -o ../bitcode/ftbitmap.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftcid.c -o ../bitcode/ftcid.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftfstype.c -o ../bitcode/ftfstype.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftgasp.c -o ../bitcode/ftgasp.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftglyph.c -o ../bitcode/ftglyph.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftgxval.c -o ../bitcode/ftgxval.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftmm.c -o ../bitcode/ftmm.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftotval.c -o ../bitcode/ftotval.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftpatent.c -o ../bitcode/ftpatent.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftpfr.c -o ../bitcode/ftpfr.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftstroke.c -o ../bitcode/ftstroke.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftsynth.c -o ../bitcode/ftsynth.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/fttype1.c -o ../bitcode/fttype1.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/base/ftwinfnt.c -o ../bitcode/ftwinfnt.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/truetype/truetype.c -o ../bitcode/truetype.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/cff/cff.c -o ../bitcode/cff.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/winfonts/winfnt.c -o ../bitcode/winfnt.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/sfnt/sfnt.c -o ../bitcode/sfnt.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/autofit/autofit.c -o ../bitcode/autofit.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/pshinter/pshinter.c -o ../bitcode/pshinter.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/smooth/smooth.c -o ../bitcode/smooth.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/raster/raster.c -o ../bitcode/raster.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/svg/svg.c -o ../bitcode/svg.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/sdf/sdf.c -o ../bitcode/sdf.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/cache/ftcache.c -o ../bitcode/ftcache.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/gzip/ftgzip.c -o ../bitcode/ftgzip.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/lzw/ftlzw.c -o ../bitcode/ftlzw.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/bzip2/ftbzip2.c -o ../bitcode/ftbzip2.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/psaux/psaux.c -o ../bitcode/psaux.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/psnames/psnames.c -o ../bitcode/psnames.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/dlg/dlgwrap.c -o ../bitcode/dlgwrap.bc && \
	llvm-gcc -c -emit-llvm -Ibuilds/unix -Iinclude -I../include $(CFLAGS) -DFT2_BUILD_LIBRARY src/tools/apinames.c -o ../bitcode/apinames.bc && \
	cp include/ft2build.h ../include/ && \
	cp -R include/freetype ../include/ && \
	cd ..
	@rm -rf freetype

clean:
	rm -rf bitcode include zlib libpng libogg libvorbis freetype
