#!/bin/sh

# Stop when failed.
set -eu

#
# Show a welcome message.
#
echo "Hello, this is the release script."

#
# Check if we run on a macOS host.
#
if [ -z "`uname -a | grep Darwin`" ]; then
    echo "Error: please run on macOS.";
    exit 1;
fi

#
# Check for GNU coreutils.
#
SED='sed'
if [ ! -z "`which gsed`" ]; then
    SED='gsed';
fi
HEAD='head'
if [ ! -z "`which ghead`" ]; then
    HEAD='ghead';
fi

#
# Guess the release version number.
#
VERSION=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../ChangeLog | tail -n1`
VERSION=`echo $VERSION | cut -d ' ' -f 3`

#
# Get the release notes.
#
NOTE_JP=`cat ../ChangeLog | awk '/BEGIN-LATEST-JP/,/END-LATEST-JP/' | tail -n +2 | $HEAD -n -1`
NOTE_EN=`cat ../ChangeLog | awk '/BEGIN-LATEST-EN/,/END-LATEST-EN/' | tail -n +2 | $HEAD -n -1`

#
# Do an interactive confirmation.
#
echo ""
echo "Are you sure you want to release version $VERSION?"
echo ""
echo "[Japanese Note]"
echo "$NOTE_JP"
echo ""
echo "[English Note]"
echo "$NOTE_EN"
echo ""
echo "(press enter to proceed)"
read str

#
# Post the start message to the Dev Server.
#
#discord-release-start-dev-bot.sh

#
# Build "game.exe".
#
echo ""
echo "Building game.exe"
say "Windows用のエンジンをビルドしています" &
cd engine-windows
rm -f *.o
if [ ! -e libroot ]; then
    ./build-libs.sh;
fi
make -j16
cp game.exe game-signed.exe
sign.sh game-signed.exe
cd ..

#
# Build the "Game.app".
#
echo ""
echo "Building Game.app (runtime-mac.dmg)."
say "Mac用のエンジンをビルドしています" &
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
say "Web用のエンジンをビルドしています" &
cd engine-wasm
make clean
make
cd ..

#
# Build the iOS source tree.
#
echo ""
echo "Building iOS source tree."
say "iOS用のソースコードを作成しています" &
cd engine-ios
make src > /dev/null
cd ..

#
# Build the Android source tree.
#
echo ""
echo "Building Android source tree."
say "Android用のソースコードを作成しています" &
cd engine-android
make debug > /dev/null
make src > /dev/null
cd ..

#
# Build "polaris-engine.exe".
#
echo ""
echo "Building polaris-engine.exe"
say "Windows用の開発ツールをビルドしています" &
cd pro-windows
rm -f *.o
if [ ! -e libroot ]; then
    cp -Rav ../engine-windows/libroot .;
fi
make -j16 VERSION="$VERSION"
sign.sh polaris-engine.exe
cd ..

#
# Build "web-test.exe"
#
if [ ! -e ../tools/web-test/web-test.exe ]; then
    echo "";
    echo "Building web-test.exe";
    say "Windows用のWebテストツールをビルドしています";
    cd ../tools/web-test;
    make;
    cd ../../build;
fi

#
# Make an installer for Windows.
#
echo ""
echo "Creating an installer for Windows."
say "Windows用のインストーラをビルドしています" &

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
make
sign.sh polaris-engine-installer.exe

cd ..

#
# Build "Polaris Engine Pro.app".
#
echo ""
echo "Building Polaris Engine Pro.app (polaris-engine.dmg)"
say "Mac用の開発ツールをビルドしています" &
cd pro-macos
rm -f polaris-engine.dmg
make
cd ..

#
# Upload.
#
echo ""
echo "Uploading files."
say "Webサーバにアップロード中です" &
until ftp-upload.sh installer-windows/polaris-engine-installer.exe "dl/polaris-engine-$VERSION.exe"; do echo "retrying..."; done
until ftp-upload.sh pro-macos/polaris-engine.dmg "dl/polaris-engine-$VERSION.dmg"; do echo "retrying..."; done
echo "Upload completed."

#
# Update the Web site.
#
echo ""
echo "Updating the Web site."
say "Webページを更新中です"
SAVE_DIR=`pwd`
cd ../web && \
    ./update-templates.sh && \
    ./update-version.sh && \
    ftp-upload.sh dl/index.html && \
    ftp-upload.sh en/dl/index.html && \
    git add -u dl/index.html en/dl/index.html && \
    git commit -m "web: release $VERSION"
cd "$SAVE_DIR"

#
# Restore a non-signed dmg for a store release.
#
mv engine-macos/game-mac-nosign.dmg engine-macos/game-mac.dmg

#
# Post to the Discord server.
#
echo ""
echo "Posting to the Discord server."
say "Discordサーバにポストします"
discord-release.sh

#
# Make a release on GitHub.
#
echo ""
echo "Making a release on GitHub."
say "GitHubでリリースを作成中です"
git tag -a "v$VERSION" -m "release"
git push github "v$VERSION"
yes "" | gh release create "v$VERSION" --title "v$VERSION"

#
# Finish.
#
echo ""
echo "Finished. $VERSION was released!"
say "リリースが完了しました"
