@echo off

del /Q /S microsoft-jdk-17.0.11-windows-x64
del /Q /S commandlinetools-win-11076708_latest

set CURRENT_DIR=%~dp0

curl -L -O https://aka.ms/download-jdk/microsoft-jdk-17.0.11-windows-x64.zip
call powershell -command "Expand-Archive microsoft-jdk-17.0.11-windows-x64.zip"
set JAVA_HOME=%CURRENT_DIR%microsoft-jdk-17.0.11-windows-x64\jdk-17.0.11+9

curl -L -O https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip
call powershell -command "Expand-Archive commandlinetools-win-11076708_latest.zip"

set ANDROID_SDK_ROOT=%CURRENT_DIR%commandlinetools-win-11076708_latest\cmdline-tools
commandlinetools-win-11076708_latest\cmdline-tools\bin\sdkmanager "platforms;android-34 --sdk_root=%ANDROID_SDK_ROOT%

gradlew.bat build
gradlew.bat --stop
