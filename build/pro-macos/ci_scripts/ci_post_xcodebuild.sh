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

###
exit 0

# Upload the exe and dmg to the Web server.
echo "\nUploading files."
curl -T installer-windows/polaris-engine-installer.exe -u $FTP ftp://ftp.lolipop.jp/sites/polaris-engine.com/polaris-engine-installer-$VERSION.exe
curl -T pro-macos/polaris-engine.dmg -u $FTP ftp://ftp.lolipop.jp/sites/polaris-engine.com/polaris-engine-installer-$VERSION.dmg
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
