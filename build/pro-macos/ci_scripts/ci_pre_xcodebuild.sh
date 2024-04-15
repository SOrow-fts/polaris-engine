#!/bin/sh

set -eu

echo PWD=`pwd`
cd ../../
echo PWD=`pwd`

# Assume we are in build/

# Initialize.
LANG=en_US.UTF-8
LANGUAGE=english

# Get the version number.
echo "\nGetting the version number."
VERSION=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../ChangeLog | tail -n1 | cut -d ' ' -f 3`
echo "VERSION=$VERSION"

# Install the Command Line Tools
yes | xcode-select --install

# Install brew dependencies.
echo "\nInstalling the brew packages."
brew install mingw-w64 emscripten makensis || true

echo "\nTesting paths..."
echo "gcc is `which i686-w64-mingw32-gcc`"
echo "emcc is `which emcc`"
export EMCC=`find /usr/local -name emcc | head -n1`
echo "emcc is $EMCC"
echo "Testing paths OK."

# Build game.exe
echo "\nBuilding game.exe file."
cd engine-windows
./build-libs.sh
make -j16
cd ..

# Build Wasm files.
echo "\nBuilding Wasm files."
cd engine-wasm
rm -rf html
make EMCC=$EMCC
cd ..

# Make a macOS source tree.
echo "\nBuilding macOS source tree."
cd engine-macos
make src > /dev/null
cd ..

# Make an iOS source tree.
echo "\nBuilding iOS source tree."
cd engine-ios
make src > /dev/null
cd ..

# Make an Android source tree.
echo "\nBuilding Android source tree."
cd engine-android
make src > /dev/null
cd ..

# Build polaris-engine.exe
echo "\nBuilding polaris-engine.exe"
cd pro-windows
mv ../engine-windows/libroot .
make -j16 VERSION="$VERSION"
cd ..

# Build web-test.exe
echo "\nBuilding web-test.exe"
cd ../tools/web-test
make
cd ../../build

# Build polaris-engine-installer.exe
echo "\nCreating an installer for Windows."
cp -v pro-windows/polaris-engine.exe installer-windows/polaris-engine.exe
rm -rf installer-windows/games
mkdir installer-windows/games
cp -R ../games/japanese-light installer-windows/games/
cp -R ../games/japanese-dark installer-windows/games/
cp -R ../games/japanese-novel installer-windows/games/
cp -R ../games/japanese-tategaki installer-windows/games/
cp -R ../games/english installer-windows/games/
cp -R ../games/english-novel installer-windows/games/
rm -rf installer-windows/tools
mkdir -p installer-windows/tools
cp engine-windows/game.exe installer-windows/tools/
cp engine-macos/game-mac.dmg installer-windows/tools/
cp -R engine-android/android-src installer-windows/tools/android-src
cp -R engine-ios/ios-src installer-windows/tools/ios-src
mkdir -p installer-windows/tools/web
cp engine-wasm/html/index.html installer-windows/tools/web/index.html
cp engine-wasm/html/index.js installer-windows/tools/web/index.js
cp engine-wasm/html/index.wasm installer-windows/tools/web/index.wasm
cp  ../tools/web-test/web-test.exe installer-windows/tools/web-test.exe
cp -R ../tools/installer installer-windows/tools/installer
cd installer-windows
make
cd ..
