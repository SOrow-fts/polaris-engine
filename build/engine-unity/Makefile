include ../common.mk

CPPFLAGS = -DPOLARIS_TARGET_UNITY

SRCS = \
	../../src/anime.c \
	../../src/conf.c \
	../../src/ciel.c \
	../../src/event.c \
	../../src/glyph.c \
	../../src/gui.c \
	../../src/halwrap.c \
	../../src/history.c \
	../../src/image.c \
	../../src/log.c \
	../../src/main.c \
	../../src/mixer.c \
	../../src/readimage.c \
	../../src/readpng.c \
	../../src/readjpeg.c \
	../../src/readwebp.c \
	../../src/save.c \
	../../src/scbuf.c \
	../../src/script.c \
	../../src/seen.c \
	../../src/stage.c \
	../../src/vars.c \
	../../src/wave.c \
	../../src/wms_core.c \
	../../src/wms_lexer.yy.c \
	../../src/wms_parser.tab.c \
	../../src/wms_impl.c \
	../../src/cmd_anime.c \
	../../src/cmd_bg.c \
	../../src/cmd_bgm.c \
	../../src/cmd_ch.c \
	../../src/cmd_cha.c \
	../../src/cmd_chapter.c \
	../../src/cmd_chs.c \
	../../src/cmd_click.c \
	../../src/cmd_gosub.c \
	../../src/cmd_goto.c \
	../../src/cmd_gui.c \
	../../src/cmd_if.c \
	../../src/cmd_layer.c \
	../../src/cmd_load.c \
	../../src/cmd_message.c \
	../../src/cmd_pencil.c \
	../../src/cmd_return.c \
	../../src/cmd_se.c \
	../../src/cmd_set.c \
	../../src/cmd_setconfig.c \
	../../src/cmd_setsave.c \
	../../src/cmd_shake.c \
	../../src/cmd_skip.c \
	../../src/cmd_switch.c \
	../../src/cmd_video.c \
	../../src/cmd_vol.c \
	../../src/cmd_wait.c \
	../../src/cmd_wms.c

#
# A target to make a test project for Windows 64bit.
#
src: win64
	@rm -rf unity-src
	@mkdir unity-src
	@cp -v -R ProjectSettings unity-src/
	@cp -v -R Packages unity-src/
	@cp -v -R Library unity-src/
	@mkdir unity-src/Assets
	@cp -v Assets/libpolaris.dll unity-src/Assets/
	@cp -v Assets/PolarisScene.unity unity-src/Assets/
	@cp -v Assets/PolarisEngine.cs unity-src/Assets/
	@cp -v Assets/PolarisAudio.cs unity-src/Assets/
	@mkdir unity-src/Assets/Resources
	@cp -v Assets/Resources/NormalShader.shader unity-src/Assets/Resources/

#
# Windows 64bit target. (for testing)
#
win64: ../engine-windows-64/libroot $(SRCS) $(LIBS_WIN64)
	x86_64-w64-mingw32-gcc -O2 -shared -o Assets/libpolaris.dll $(CPPFLAGS) -I../engine-windows-64/libroot/include -I../engine-windows-64/libroot/include/freetype2 $(SRCS) ../engine-windows-64/libroot/lib/libwebp.a ../engine-windows-64/libroot/lib/libwebpdemux.a ../engine-windows-64/libroot/lib/libsharpyuv.a ../engine-windows-64/libroot/lib/libfreetype.a ../engine-windows-64/libroot/lib/libbrotlidec.a ../engine-windows-64/libroot/lib/libbrotlicommon.a ../engine-windows-64/libroot/lib/libpng16.a ../engine-windows-64/libroot/lib/libjpeg.a ../engine-windows-64/libroot/lib/libvorbisfile.a ../engine-windows-64/libroot/lib/libvorbisenc.a ../engine-windows-64/libroot/lib/libvorbis.a ../engine-windows-64/libroot/lib/libogg.a ../engine-windows-64/libroot/lib/libbz2.a ../engine-windows-64/libroot/lib/libz.a

#
# Windows 32bit target. (not in use)
#
win32: ../engine-windows-64/libroot $(SRCS) $(LIBS_WIN32)
	i686-w64-mingw32-gcc -O2 -shared -o Assets/libpolaris.dll $(CPPFLAGS) -I../engine-windows/libroot/include -I../engine-windows/libroot/include/freetype2 $(SRCS) ../engine-windows/libroot/lib/libwebp.a ../engine-windows/libroot/lib/libwebpdemux.a ../engine-windows/libroot/lib/libsharpyuv.a ../engine-windows/libroot/lib/libfreetype.a ../engine-windows/libroot/lib/libbrotlidec.a ../engine-windows/libroot/lib/libbrotlicommon.a ../engine-windows/libroot/lib/libbrotlicommon.a ../engine-windows/libroot/lib/libpng16.a ../engine-windows/libroot/lib/libjpeg.a ../engine-windows/libroot/lib/libvorbisfile.a ../engine-windows/libroot/lib/libvorbisenc.a ../engine-windows/libroot/lib/libvorbis.a ../engine-windows/libroot/lib/libogg.a ../engine-windows/libroot/lib/libbz2.a ../engine-windows/libroot/lib/libz.a

#
# Mac target. (for testing)
#
macos: ../engine-macos/libroot $(SRCS)
	rm -rf Assets/libpolaris.bundle
	clang -O2 -arch arm64 -arch x86_64 -dynamiclib -undefined dynamic_lookup -o Assets/libpolaris.dylib $(CPPFLAGS) -I../engine-macos/libroot/include -I../engine-macos/libroot/include/freetype2 $(SRCS) ../engine-macos/libroot/lib/libwebp.a ../engine-macos/libroot/lib/libwebpdemux.a ../engine-macos/libroot/lib/libfreetype.a ../engine-macos/libroot/lib/libbrotlidec.a ../engine-macos/libroot/lib/libbrotlicommon.a ../engine-macos/libroot/lib/libsharpyuv.a ../engine-macos/libroot/lib/libpng16.a ../engine-macos/libroot/lib/libjpeg.a ../engine-macos/libroot/lib/libvorbisfile.a ../engine-macos/libroot/lib/libvorbisenc.a ../engine-macos/libroot/lib/libvorbis.a ../engine-macos/libroot/lib/libogg.a ../engine-macos/libroot/lib/libbz2.a ../engine-macos/libroot/lib/libz.a
	rm -rf Assets/libpolaris.dylib.dSYM

#
# An example target for NX.
#  - Note that the author does not have a copy of SDK for NX, so please adjust to the actual SDK you received.
#
nx:
	./build-libs.sh aarch64-elf aarch64-elf-gcc aarch64-elf-ar
	mv libroot-aarch64-elf libroot-nx
	aarch64-elf-gcc -O2 -shared -fPIC -o Assets/libpolaris.so $(CPPFLAGS) -DNO_CDECL -DNO_WEBP -Ilibroot-nx/include -Ilibroot-nx/include/freetype2 $(SRCS) libroot-nx/lib/libfreetype.a libroot-nx/lib/libbrotlidec.a libroot-nx/lib/libbrotlicommon.a libroot-nx/lib/libpng16.a libroot-nx/lib/libjpeg.a libroot-nx/lib/libvorbisfile.a libroot-nx/lib/libvorbisenc.a libroot-nx/lib/libvorbis.a libroot-nx/lib/libogg.a libroot-nx/lib/libbz2.a libroot-nx/lib/libz.a

#
# An example target for PS4/5.
#  - Note that the author does not have a copy of SDK for PS4/5, so please adjust to the actual SDK you received.
#
ps4:
	./build-libs.sh x86_64-elf x86_64-elf-clang x86_64-elf-ar
	mv libroot-x86_64-elf libroot-ps4
	x86_64-elf-clang -O2 -shared -fPIC -o Assets/libpolaris.so $(CPPFLAGS) -DNO_CDECL -DNO_WEBP -Ilibroot-ps4/include -Ilibroot-ps4/include/freetype2 $(SRCS) libroot-ps4/lib/libfreetype.a libroot-ps4/lib/libbrotlidec.a libroot-ps4/lib/libbrotlicommon.a libroot-ps4/lib/libpng16.a libroot-ps4/lib/libjpeg.a libroot-ps4/lib/libvorbisfile.a libroot-ps4/lib/libvorbisenc.a libroot-ps4/lib/libvorbis.a libroot-ps4/lib/libogg.a libroot-ps4/lib/libbz2.a libroot-ps4/lib/libz.a

#
# An example target for Xbox.
#  - Note that the author does not have a copy of SDK for Xbox, so please adjust to the actual SDK you received.
#
xbox:
	./build-libs.sh x86_64-something x86_64-something-clang x86_64-something-ar
	mv libroot-x86_64-something libroot-xbox
	x86_64-something-clang -O2 -shared -fPIC -o Assets/libpolaris.so $(CPPFLAGS) -DNO_CDECL -DNO_WEBP -Ilibroot-xbox/include -Ilibroot-xbox/include/freetype2 $(SRCS) libroot-xbox/lib/libfreetype.a libroot-xbox/lib/libbrotlidec.a libroot-xbox/lib/libbrotlicommon.a libroot-xbox/lib/libpng16.a libroot-xbox/lib/libjpeg.a libroot-xbox/lib/libvorbisfile.a libroot-xbox/lib/libvorbisenc.a libroot-xbox/lib/libvorbis.a libroot-xbox/lib/libogg.a libroot-xbox/lib/libbz2.a libroot-xbox/lib/libz.a

#
# Cleanup
#
clean:
	@rm -rf Assets/libpolaris.dylib* Assets/libpolaris.so* Assets/libpolaris.dll* libroot* include
