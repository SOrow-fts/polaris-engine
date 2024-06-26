#!/bin/bash

# Get the version and the date strings.
HEADER=`grep -a1 '<!-- BEGIN-LATEST-JP -->' ../ChangeLog | tail -n1`
VERSION=`echo $HEADER | cut -d '>' -f 2 | cut -d ' ' -f 3`
DATE=`echo $HEADER | cut -d ' ' -f 4`

# Get the release notes for Japanese and English.
NOTE_JP=`cat ../ChangeLog | awk '/BEGIN-LATEST-JP/,/END-LATEST-JP/' | tail -n +2 | sed '$d'`
NOTE_EN=`cat ../ChangeLog | awk '/BEGIN-LATEST-EN/,/END-LATEST-EN/' | tail -n +2 | sed '$d'`

# Update /dl/index.html
cat dl/index.html | \
sed -e "s|.*LATEST-VERSION-AND-DATE.*|<!-- LATEST-VERSION-AND-DATE -->最新版 Polaris Engine $VERSION \($DATE\):<br>|" \
     -e "s|.*LATEST-EXE.*|<!-- LATEST-EXE --><a href=\"/dl/polaris-engine-$VERSION.exe\">Windows版 Polaris Engine</a><br>|" \
     -e "s|.*LATEST-DMG.*|<!-- LATEST-DMG --><a href=\"/dl/polaris-engine-$VERSION.dmg\">Mac版 Polaris Engine</a><br>|" \
 > tmp
cat tmp | awk '/.*DOCTYPE html.*/,/.*LATEST-RELEASE-NOTE.*/' > before
cat tmp | awk '/.*LATEST-RELEASE-NOTE.*/,/\<\/html\>/' | tail -n +2 > after
cat before > new
echo $NOTE_JP >> new
cat after >> new
cp new dl/index.html
rm -f before after new tmp

# Update /en/dl/index.html
cat en/dl/index.html | \
sed -e "s|.*LATEST-VERSION-AND-DATE.*|<!-- LATEST-VERSION-AND-DATE -->Latest $VERSION \($DATE\):<br>|" \
    -e "s|.*LATEST-EXE.*|<!-- LATEST-EXE --><a href=\"/dl/polaris-engine-$VERSION.exe\">Download Polaris Engine for Windows</a><br>|" \
    -e "s|.*LATEST-DMG.*|<!-- LATEST-DMG --><a href=\"/dl/polaris-engine-$VERSION.exe\">Download Polaris Engine for Mac</a><br>|" \
  > tmp
cat tmp | awk '/.*DOCTYPE html.*/,/.*LATEST-RELEASE-NOTE.*/' > before
cat tmp | awk '/.*LATEST-RELEASE-NOTE.*/,/\<\/html\>/' | tail -n +2 > after
cat before > new
echo $NOTE_EN >> new
cat after >> new
cp new en/dl/index.html
rm -f before after new tmp
