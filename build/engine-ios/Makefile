include ../common.mk

FILES_IOS= \
	engine-ios/main.m \
	engine-ios/AppDelegate.h \
	engine-ios/AppDelegate.m \
	engine-ios/SceneDelegate.h \
	engine-ios/SceneDelegate.m \
	engine-ios/ViewController.h \
	engine-ios/ViewController.m \
	engine-ios/GameView.h \
	engine-ios/GameView.m \
	../../src/apple/aunit.h \
	../../src/apple/aunit.c \
	../../src/apple/GameRenderer.h \
	../../src/apple/GameShaderTypes.h \
	../../src/apple/GameViewControllerProtocol.h \
	../../src/apple/GameRenderer.m \
	../../src/apple/GameShaders.metal

src: libroot-device libroot-sim
	@rm -rf ios-src
	@mkdir ios-src
	@cp -R engine-ios engine-ios.xcodeproj build.sh ExportOptions.plist ios-src/
	@sed -e 's|../../src/apple/|engine-ios/apple/|g' < ios-src/engine-ios.xcodeproj/project.pbxproj > tmpfile && mv tmpfile ios-src/engine-ios.xcodeproj/project.pbxproj
	@sed -e 's|../../src/|engine-ios/|g' < ios-src/engine-ios.xcodeproj/project.pbxproj > tmpfile && mv tmpfile ios-src/engine-ios.xcodeproj/project.pbxproj
	@mkdir -p ios-src/engine-ios/apple
	@cp ../../src/apple/GameRenderer.h ios-src/engine-ios/apple/
	@cp ../../src/apple/GameRenderer.m ios-src/engine-ios/apple/
	@cp ../../src/apple/GameShaders.metal ios-src/engine-ios/apple/
	@cp ../../src/apple/GameShaderTypes.h ios-src/engine-ios/apple/
	@cp ../../src/apple/GameViewControllerProtocol.h ios-src/engine-ios/apple/
	@cp ../../src/apple/aunit.c ios-src/engine-ios/apple/
	@cp ../../src/apple/aunit.h ios-src/engine-ios/apple/
	@cp ../../src/anime.c ios-src/engine-ios/
	@cp ../../src/anime.h ios-src/engine-ios/
	@cp ../../src/ciel.c ios-src/engine-ios/
	@cp ../../src/ciel.h ios-src/engine-ios/
	@cp ../../src/conf.c ios-src/engine-ios/
	@cp ../../src/conf.h ios-src/engine-ios/
	@cp ../../src/event.c ios-src/engine-ios/
	@cp ../../src/event.h ios-src/engine-ios/
	@cp ../../src/file.h ios-src/engine-ios/
	@cp ../../src/file.c ios-src/engine-ios/
	@cp ../../src/glyph.c ios-src/engine-ios/
	@cp ../../src/glyph.h ios-src/engine-ios/
	@cp ../../src/gui.c ios-src/engine-ios/
	@cp ../../src/gui.h ios-src/engine-ios/
	@cp ../../src/history.c ios-src/engine-ios/
	@cp ../../src/history.h ios-src/engine-ios/
	@cp ../../src/image.c ios-src/engine-ios/
	@cp ../../src/image.h ios-src/engine-ios/
	@cp ../../src/key.h ios-src/engine-ios/
	@cp ../../src/log.c ios-src/engine-ios/
	@cp ../../src/log.h ios-src/engine-ios/
	@cp ../../src/main.c ios-src/engine-ios/
	@cp ../../src/main.h ios-src/engine-ios/
	@cp ../../src/mixer.c ios-src/engine-ios/
	@cp ../../src/mixer.h ios-src/engine-ios/
	@cp ../../src/motion.h ios-src/engine-ios/
	@cp ../../src/hal.h ios-src/engine-ios/
	@cp ../../src/readimage.c ios-src/engine-ios/
	@cp ../../src/readpng.c ios-src/engine-ios/
	@cp ../../src/readjpeg.c ios-src/engine-ios/
	@cp ../../src/readwebp.c ios-src/engine-ios/
	@cp ../../src/save.c ios-src/engine-ios/
	@cp ../../src/save.h ios-src/engine-ios/
	@cp ../../src/scbuf.c ios-src/engine-ios/
	@cp ../../src/scbuf.h ios-src/engine-ios/
	@cp ../../src/script.c ios-src/engine-ios/
	@cp ../../src/script.h ios-src/engine-ios/
	@cp ../../src/seen.c ios-src/engine-ios/
	@cp ../../src/seen.h ios-src/engine-ios/
	@cp ../../src/stage.c ios-src/engine-ios/
	@cp ../../src/stage.h ios-src/engine-ios/
	@cp ../../src/uimsg.c ios-src/engine-ios/
	@cp ../../src/uimsg.h ios-src/engine-ios/
	@cp ../../src/polaris.h ios-src/engine-ios/
	@cp ../../src/types.h ios-src/engine-ios/
	@cp ../../src/vars.c ios-src/engine-ios/
	@cp ../../src/vars.h ios-src/engine-ios/
	@cp ../../src/wave.c ios-src/engine-ios/
	@cp ../../src/wave.h ios-src/engine-ios/
	@cp ../../src/wms_core.c ios-src/engine-ios/
	@cp ../../src/wms_core.h ios-src/engine-ios/
	@cp ../../src/wms.h ios-src/engine-ios/
	@cp ../../src/wms_impl.c ios-src/engine-ios/
	@cp ../../src/wms_lexer.yy.c ios-src/engine-ios/
	@cp ../../src/wms_parser.tab.c ios-src/engine-ios/
	@cp ../../src/wms_parser.tab.h ios-src/engine-ios/
	@cp ../../src/cmd_anime.c ios-src/engine-ios/
	@cp ../../src/cmd_bg.c ios-src/engine-ios/
	@cp ../../src/cmd_bgm.c ios-src/engine-ios/
	@cp ../../src/cmd_cha.c ios-src/engine-ios/
	@cp ../../src/cmd_chapter.c ios-src/engine-ios/
	@cp ../../src/cmd_ch.c ios-src/engine-ios/
	@cp ../../src/cmd_chs.c ios-src/engine-ios/
	@cp ../../src/cmd_click.c ios-src/engine-ios/
	@cp ../../src/cmd_gosub.c ios-src/engine-ios/
	@cp ../../src/cmd_goto.c ios-src/engine-ios/
	@cp ../../src/cmd_gui.c ios-src/engine-ios/
	@cp ../../src/cmd_if.c ios-src/engine-ios/
	@cp ../../src/cmd_layer.c ios-src/engine-ios/
	@cp ../../src/cmd_load.c ios-src/engine-ios/
	@cp ../../src/cmd_message.c ios-src/engine-ios/
	@cp ../../src/cmd_pencil.c ios-src/engine-ios/
	@cp ../../src/cmd_return.c ios-src/engine-ios/
	@cp ../../src/cmd_se.c ios-src/engine-ios/
	@cp ../../src/cmd_set.c ios-src/engine-ios/
	@cp ../../src/cmd_setconfig.c ios-src/engine-ios/
	@cp ../../src/cmd_setsave.c ios-src/engine-ios/
	@cp ../../src/cmd_shake.c ios-src/engine-ios/
	@cp ../../src/cmd_skip.c ios-src/engine-ios/
	@cp ../../src/cmd_switch.c ios-src/engine-ios/
	@cp ../../src/cmd_video.c ios-src/engine-ios/
	@cp ../../src/cmd_vol.c ios-src/engine-ios/
	@cp ../../src/cmd_wait.c ios-src/engine-ios/
	@cp ../../src/cmd_wms.c ios-src/engine-ios/
	@cp -Ra libroot-device ios-src/
	@cp -Ra libroot-sim ios-src/
	@mkdir ios-src/Resources

libroot-device:
	./build-libs-device.sh

libroot-sim:
	./build-libs-sim.sh
