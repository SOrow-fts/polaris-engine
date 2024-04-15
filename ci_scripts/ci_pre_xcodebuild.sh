#!/bin/sh

# Initialize.
LANG=en_US.UTF-8
LANGUAGE=english

# Get the version number.
echo "\nGetting the version number."
cd build/
VERSION=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../ChangeLog | tail -n1 | cut -d ' ' -f 3`
echo "VERSION=$VERSION"

# Install brew dependencies.
echo "\nInstalling the brew packages."
brew install mingw-w64 emscripten makensis
echo gcc is `which i686-w64-mingw32-gcc`

# Build game.exe
echo "\nBuilding game.exe file."
cd engine-windows
curl -O https://polaris-engine.com/dl/libroot-windows.tar.gz
tar xzf libroot-windows.tar.gz
make -j8
cd ..

# Build Game.app (game-mac.dmg)
echo "\nBuilding Game.app (game-mac.dmg)."
cd engine-macos
curl -O https://polaris-engine.com/dl/libroot-mac.tar.gz
tar xzf libroot-mac.tar.gz
make game-mac.dmg
cp game-mac.dmg
codesign --sign 'Developer ID Application: Keiichi TABATA' game-mac.dmg
cd ..

# Build Wasm files.
echo "\nBuilding Wasm files."
cd engine-wasm
make
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
make -j8 VERSION="$VERSION"
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

# Build Polaris Engine.app (polaris-engine.dmg)
echo "\nBuilding Polaris Engine.app (polaris-engine.dmg)"
cd pro-macos
make
cd ..

# Upload the exe and dmg to the Web server.
echo "\nUploading files."
curl -T installer-windows/polaris-engine-installer.exe -u ${{ secrets.ftp }} ftp://ftp.lolipop.jp/sites/polaris-engine.com/polaris-engine-installer-$VERSION.exe
curl -T pro-macos/polaris-engine.dmg -u ${{ secrets.ftp }} ftp://ftp.lolipop.jp/sites/polaris-engine.com/polaris-engine-installer-$VERSION.dmg
echo "Upload completed."
cd ..

# Update the Web site.
echo "\nUpdating the Web site."
cd web
curl -o dl/index.html https://polaris-engine.com/dl/index.html
curl -o en/dl/index.html https://polaris-engine.com/en/dl/index.html
./update-templates.sh
./update-version.sh
curl -T dl/index.html -u $FTP ftp://ftp.lolipop.jp/sites/polaris-engine.com/dl/index.html
curl -T en/dl/index.html -u $FTP ftp://ftp.lolipop.jp/sites/polaris-engine.com/en/dl/index.html
cd ..

# Post to Discord.
cd build
echo "\nPosting to Discord."
NOTE_JP=`cat ChangeLog | awk '/BEGIN-LATEST-JP/,/END-LATEST-JP/' | tail -n +2 | sed '$d'`
NOTE_JP=`echo "$NOTE_JP" | sed -e 's/<li>Polaris Engine/## Polaris Engine/g'`
NOTE_JP=`echo "$NOTE_JP" | sed -e 's/    <li>/* /g'`
NOTE_JP=`echo "$NOTE_JP" | sed -e 's/<ul>//g'`
NOTE_JP=`echo "$NOTE_JP" | sed -e 's/<\/ul>//g'`
NOTE_JP=`echo "$NOTE_JP" | sed -e 's/<\/li>/\n/g'`
NOTE_JP=`echo "$NOTE_JP" | sed -e 's/^ *$//g'`
NOTE_JP=`echo "$NOTE_JP" | awk '$0 != ""{print $0}'`
NOTE_JP=`printf "$NOTE_JP\n\nダウンロードはこちら: https://polaris-engine.com/dl/"`
NOTE_JP=`echo "$NOTE_JP" | sed -z 's/\n/\\\\n/g'`
echo $NOTE_JP
curl -H 'Content-Type: application/json' -X 'POST' -d "{\"username\": \"リリース\", \"content\": \"$NOTE_JP\"}" $DEVHOOK
curl -H 'Content-Type: application/json' -X 'POST' -d "{\"username\": \"リリース\", \"content\": \"$NOTE_JP\"}" $USERHOOK
