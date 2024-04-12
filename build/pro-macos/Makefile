include ../common.mk

FILES_MACOS = \
	pro-macos/main.m \
	pro-macos/AppDelegate.h \
	pro-macos/AppDelegate.m \
	pro-macos/ViewController.h \
	pro-macos/ViewController.m \
	pro-macos/GameView.h \
	pro-macos/GameView.m \
	../../src/apple/aunit.h \
	../../src/apple/aunit.c \
	../../src/apple/GameRenderer.h \
	../../src/apple/GameShaderTypes.h \
	../../src/apple/GameViewControllerProtocol.h \
	../../src/apple/GameRenderer.m \
	../../src/apple/GameShaders.metal

main: polaris-engine.dmg

polaris-engine.dmg: libroot $(SRCS_MAIN) $(HDRS_MAIN) $(FILES_MACOS)
	@echo "Building Polaris .app"
	@rm -rf build
	@xcodebuild -quiet -scheme pro-macos -project pro-macos.xcodeproj -configuration Release -archivePath `pwd`/build/Release/pro-macos.xcarchive archive
	@xcodebuild -quiet -exportArchive -archivePath `pwd`/build/Release/pro-macos.xcarchive -exportOptionsPlist export-options.plist
	@rm -rf "build/Release/Polaris Engine.app"
	@until \
		xcodebuild -quiet -exportNotarizedApp -archivePath `pwd`/build/Release/pro-macos.xcarchive -exportPath `pwd`/build/Release; \
	do \
		echo "retrying..."; \
		sleep 10; \
	done
	@rm -rf tmp *.dmg
	@mkdir tmp
	@cp -Ra "build/Release/Polaris Engine.app" "tmp/Polaris Engine.app"
	@create-dmg \
		--volname "Polaris Engine Installer" \
		--window-pos 200 120 \
		--window-size 800 400 \
		--icon-size 100 \
		--icon "Polaris Engine.app" 200 190 \
		--app-drop-link 600 185 \
		--format ULFO \
		"polaris-engine.dmg" \
		"tmp"
	@codesign --sign 'Developer ID Application: Keiichi TABATA' polaris-engine.dmg

libroot:
	./build-libs.sh

clean:
	@rm -rf build polaris-engine.dmg libroot-mac.tar.gz libroot
