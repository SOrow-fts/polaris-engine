#!/bin/sh

set -eu

# Get the version Polaris Engine.
VERSION=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../../ChangeLog | tail -n1`
VERSION=`echo $VERSION | cut -d ' ' -f 3`

# Get the minor version.
MINOR=1
if [ $# != 0 ]; then
	MINOR="$1";
fi

# Update the changelog for 22.04 jammy
echo "polaris-engine ($VERSION-$MINOR) jammy; urgency=medium" > debian/changelog;
echo '' >> debian/changelog;
echo '  * Sync upstream' >> debian/changelog;
echo '' >> debian/changelog;
echo " -- Keiichi Tabata <ktabata@polaris-engine.com>  `date '+%a, %d %b %Y %T %z'`" >> debian/changelog;

# Make a directory and enter it.
rm -rf work
mkdir work
cd work

# Create a source tarball.
SAVE_DIR=`pwd`
cd ../../../
git archive HEAD --output=build/ppa/work/polaris-engine_$VERSION.orig.tar.gz
cd "$SAVE_DIR"

# Make a sub-directory with version number, and enter it.
rm -rf polaris-engine-$VERSION
mkdir polaris-engine-$VERSION
cp -R ../debian polaris-engine-$VERSION/
cd polaris-engine-$VERSION
tar xzf ../polaris-engine_$VERSION.orig.tar.gz

# Build a source package.
debuild -S -sa
#debuild -b
cd ..

# Sign.
debsign -k 9ECC850965003AE23EC2B32723D69C6FB2E053E4 "polaris-engine_${VERSION}-${MINOR}_source.changes"

# Upload.
dput ppa:ktabata/ppa polaris-engine_${VERSION}-${MINOR}_source.changes 
cd ../

# Cleanup.
rm -rf work
