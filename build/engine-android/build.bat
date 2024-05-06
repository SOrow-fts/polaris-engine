@ech off

del /Q /S microsoft-jdk-17.0.11-windows-x64
del /Q /S commandlinetools-win-11076708_latest

set CURRENT_DIR=%~dp0

curl -L -O https://aka.ms/download-jdk/microsoft-jdk-17.0.11-windows-x64.zip
call powershell -command "Expand-Archive microsoft-jdk-17.0.11-windows-x64.zip"

set JAVA_HOME=%CURRENT_DIR%microsoft-jdk-17.0.11-windows-x64\jdk-17.0.11+9

gradlew.bat build
