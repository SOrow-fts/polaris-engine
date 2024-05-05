CPPFLAGS = -DPOLARIS_TARGET_UNITY -DNO_WEBP -DNO_JPEG -Ilibroot/include -Ilibroot/include/freetype

LIBS = \
	libroot/lib/libfreetype.a \
	libroot/lib/libpng16.a \
	libroot/lib/libvorbisfile.a \
	libroot/lib/libvorbisenc.a \
	libroot/lib/libvorbis.a \
	libroot/lib/libogg.a \
	libroot/lib/libz.a

all: llvm-to-msil

llvm-to-msil: libpolaris.a
	llc -march=msil libpolaris.a

libpolaris.a: libroot
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/anime.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/conf.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/ciel.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/event.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/glyph.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/gui.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/halwrap.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/history.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/image.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/log.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/main.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/mixer.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/readimage.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/readpng.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/readjpeg.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/readwebp.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/save.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/scbuf.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/script.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/seen.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/stage.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/vars.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/wave.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/wms_core.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/wms_lexer.yy.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/wms_parser.tab.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/wms_impl.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_anime.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_bg.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_bgm.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_ch.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_cha.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_chapter.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_chs.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_click.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_gosub.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_goto.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_gui.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_if.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_layer.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_load.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_message.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_pencil.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_return.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_se.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_set.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_setconfig.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_setsave.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_shake.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_skip.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_switch.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_video.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_vol.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_wait.c
	llvm-gcc -c -emit-llvm $(CPPFLAGS) ../../src/cmd_wms.c
	llvm-ar rcs libpolaris.a anime.bc conf.bc ciel.bc event.bc glyph.bc gui.bc halwrap.bc history.bc image.bc log.bc main.bc mixer.bc readimage.bc readpng.bc save.bc scbuf.bc script.bc seen.bc stage.bc vars.bc wave.bc wms_core.bc wms_lexer.yy.bc wms_parser.tab.bc wms_impl.bc cmd_anime.bc cmd_bg.bc cmd_bgm.bc cmd_ch.bc cmd_cha.bc cmd_chapter.bc cmd_chs.bc cmd_click.bc cmd_gosub.bc cmd_goto.bc cmd_gui.bc cmd_if.bc cmd_layer.bc cmd_load.bc cmd_message.bc cmd_pencil.bc cmd_return.bc cmd_se.bc cmd_set.bc cmd_setconfig.bc cmd_setsave.bc cmd_shake.bc cmd_skip.bc cmd_switch.bc cmd_video.bc cmd_vol.bc cmd_wait.bc cmd_wms.bc

libroot:
	./build-libs.sh

clean:
	rm -rf libpolaris.a libroot tmp
