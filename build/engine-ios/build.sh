#!/bin/sh

xcodebuild archive -archivePath app.xcarchive -scheme engine-ios
xcodebuild -exportArchive -archivePath app.xcarchive -exportOptionsPlist ExportOptions.plist -exportPath app

exit
