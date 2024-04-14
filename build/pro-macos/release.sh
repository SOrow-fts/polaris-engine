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

#
# Show a message.
#
echo "CI/CD pipeline started."

#
# Guess the release version number.
#
VERSION=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../ChangeLog | tail -n1`
VERSION=`echo $VERSION | cut -d ' ' -f 3`

#
# Get the release notes.
#
NOTE_JP=`cat ../ChangeLog | awk '/BEGIN-LATEST-JP/,/END-LATEST-JP/' | tail -n +2 | sed '$d'`
NOTE_EN=`cat ../ChangeLog | awk '/BEGIN-LATEST-EN/,/END-LATEST-EN/' | tail -n +2 | sed '$d'`

#
# Debug Output
#
echo ""
echo "[Japanese Note]"
echo "$NOTE_JP"
echo ""
echo "[English Note]"
echo "$NOTE_EN"
echo ""

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
rm -f game-mac.dmg game-mac-nosign.dmg
make game-mac.dmg
cp game-mac.dmg game-mac-nosign.dmg
codesign --sign 'Developer ID Application: Keiichi TABATA' game-mac.dmg
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

# Make an installe
cd installer-windows
export LANG=en_US.UTF-8
export LANGUAGE=english
make
#sign.sh polaris-engine-installer.exe

cd ..

#
# Build "Polaris Engine Pro.app".
#
echo ""
echo "Building Polaris Engine Pro.app (polaris-engine.dmg)"
cd pro-macos
make
cd ..

#
# Upload.
#
echo ""
echo "Uploading files."
curl -v -T installer-windows/polaris-engine-installer.exe -u $FTP_USER_PW ftp://ftp.lolipop.jp/sites/polaris-engine.com/polaris-engine-installer-$VERSION.exe
curl -v -T pro-macos/polaris-engine.dmg -u $FTP_USER_PW ftp://ftp.lolipop.jp/sites/polaris-engine.com/polaris-engine-installer-$VERSION.dmg
echo "Upload completed."

#
# Update the Web site.
#
echo ""
echo "Updating the Web site."
SAVE_DIR=`pwd`
cd ../web && \
    curl -o dl/index.html https://polaris-engine.com/dl/index.html
    curl -o en/dl/index.html https://polaris-engine.com/en/dl/index.html
    ./update-templates.sh && \
    ./update-version.sh && \
curl -v -T dl/index.html  -u $FTP_USER_PW ftp://ftp.lolipop.jp/sites/polaris-engine.com/dl/index.html
curl -v -T en/dl/index.html  -u $FTP_USER_PW ftp://ftp.lolipop.jp/sites/polaris-engine.com/en/dl/index.html
cd "$SAVE_DIR"

#
# Post to the Discord server.
#
echo ""
echo "Posting to the Discord server."
#TODO

#
# Finish.
#
echo ""
echo "Finished. $VERSION was released!"
