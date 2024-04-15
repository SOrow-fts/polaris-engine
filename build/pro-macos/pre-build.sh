#!/bin/sh

#
# Only for cloud.
#
if [ -z "$FTP_USER_PW" ]; then
    exit 0;
fi

#
# Initialize.
#
set -eu
export LANG=en_US.UTF-8
export LANGUAGE=english

cd ..

#
# Get the release version number.
#
VERSION=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../ChangeLog | tail -n1 | cut -d ' ' -f 3`

#
# Install dependencies.
#
echo ""
echo "Installing brew dependencies."

brew install mingw-w64 emscripten gsed wget makensis create-dmg

#
# Build "game.exe".
#
echo ""
echo "Building game.exe"
cd engine-windows
curl -O https://polaris-engine.com/dl/libroot-windows.tar.gz
tar xzf libroot-windows.tar.gz
exit 0

make -j16
cp game.exe game-signed.exe
#sign.sh game-signed.exe
cd ..

#
# Build the "Game.app".
#
echo ""
echo "Building Game.app (runtime-mac.dmg)."
cd engine-macos
curl -O https://polaris-engine.com/dl/libroot-mac.tar.gz
tar xzf libroot-mac.tar.gz
make game-mac.dmg
cp game-mac.dmg game-mac-nosign.dmg
#codesign --sign 'Developer ID Application: Keiichi TABATA' game-mac.dmg
cd ..

#
# Build the Wasm files.
#
echo ""
echo "Building Wasm files."
cd engine-wasm
make
cd ..

#
# Build the iOS source tree.
#
echo ""
echo "Building iOS source tree."
cd engine-ios
make src > /dev/null
cd ..

#
# Build the Android source tree.
#
echo ""
echo "Building Android source tree."
cd engine-android
make src > /dev/null
cd ..

#
# Build "polaris-engine.exe".
#
echo ""
echo "Building polaris-engine.exe"
cd pro-windows
cp -Rav ../engine-windows/libroot .
make -j16 VERSION="$VERSION"
#sign.sh polaris-engine.exe
cd ..

#
# Build "web-test.exe"
#
echo ""
echo "Building web-test.exe"
cd ../tools/web-test
make
cd ../../build

#
# Make an installer for Windows.
#
echo ""
echo "Creating an installer for Windows."

# /
cp -v pro-windows/polaris-engine.exe installer-windows/polaris-engine.exe

# /games
rm -rf installer-windows/games
find ../games -name '.DS_Store' | xargs rm
mkdir installer-windows/games
cp -R ../games/japanese-light installer-windows/games/
cp -R ../games/japanese-dark installer-windows/games/
cp -R ../games/japanese-novel installer-windows/games/
cp -R ../games/japanese-tategaki installer-windows/games/
cp -R ../games/english installer-windows/games/
cp -R ../games/english-novel installer-windows/games/

# /tools
rm -rf installer-windows/tools
mkdir -p installer-windows/tools
cp  engine-windows/game.exe installer-windows/tools/
cp  engine-windows/game-signed.exe installer-windows/tools/
cp engine-macos/game-mac.dmg installer-windows/tools/
cp -R engine-android/android-src installer-windows/tools/android-src
cp -R engine-ios/ios-src installer-windows/tools/ios-src
mkdir -p installer-windows/tools/web
cp engine-wasm/html/index.html installer-windows/tools/web/index.html
cp engine-wasm/html/index.js installer-windows/tools/web/index.js
cp engine-wasm/html/index.wasm installer-windows/tools/web/index.wasm
cp  ../tools/web-test/web-test.exe installer-windows/tools/web-test.exe
cp -R ../tools/installer installer-windows/tools/installer

# Make an installer
cd installer-windows
export LANG=en_US.UTF-8
export LANGUAGE=english
make
#sign.sh polaris-engine-installer.exe

cd ..
