include ../common.mk

FILES_APPLE = \
	engine-macos/main.m \
	engine-macos/AppDelegate.h \
	engine-macos/AppDelegate.m \
	engine-macos/ViewController.h \
	engine-macos/ViewController.m \
	engine-macos/GameView.h \
	engine-macos/GameView.m \
	../../src/apple/aunit.h \
	../../src/apple/aunit.c \
	../../src/apple/GameRenderer.h \
	../../src/apple/GameShaderTypes.h \
	../../src/apple/GameViewControllerProtocol.h \
	../../src/apple/GameRenderer.m \
	../../src/apple/GameShaders.metal

main: game-mac.dmg

game-mac.dmg: libroot $(SRCS_MAIN) $(HDRS_MAIN) $(FILES_APPLE)
	@echo "Building Game.app"
	@xcodebuild -quiet -scheme engine-macos -project engine-macos.xcodeproj -configuration Release -archivePath `pwd`/build/Release/engine-macos.xcarchive archive
	@xcodebuild -quiet -exportArchive -archivePath `pwd`/build/Release/engine-macos.xcarchive -exportOptionsPlist export-options.plist
	@rm -rf build/Release/Game.app
	@until \
		xcodebuild -quiet -exportNotarizedApp -archivePath `pwd`/build/Release/engine-macos.xcarchive -exportPath `pwd`/build/Release > /dev/null 2>&1; \
	do \
		echo "Waiting 10 seconds for notarization..."; \
		sleep 10; \
	done
	@echo "Successfully notarized."
	@rm -f game-mac.dmg
	@mkdir tmp
	@cp -Rv build/Release/Game.app tmp/
	@hdiutil create -fs HFS+ -format UDBZ -srcfolder tmp -volname game-mac game-mac.dmg
	@rm -rf tmp

libroot:
	./build-libs.sh

clean:
	@rm -rf build game-mac.dmg libroot-mac.tar.gz libroot
