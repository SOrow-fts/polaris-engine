#!/bin/sh

#
# Only on Xcode Cloud.
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
# Make DMG.
#
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
cd ../web && \
    curl -o dl/index.html https://polaris-engine.com/dl/index.html
    curl -o en/dl/index.html https://polaris-engine.com/en/dl/index.html
    ./update-templates.sh && \
    ./update-version.sh && \
curl -T dl/index.html  -u $FTP_USER_PW ftp://ftp.lolipop.jp/sites/polaris-engine.com/dl/index.html
curl -T en/dl/index.html  -u $FTP_USER_PW ftp://ftp.lolipop.jp/sites/polaris-engine.com/en/dl/index.html

#
# Post to the Discord server.
#
echo ""
echo "Posting to the Discord server."
#TODO
