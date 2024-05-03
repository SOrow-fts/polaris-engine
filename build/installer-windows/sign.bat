@echo off

PATH=C:\Program Files (x86)\Windows Kits\10\bin\10.0.22621.0\x86

echo Signing...
signtool sign /n "Open Source Developer, Keiichi Tabata" /tr http://time.certum.pl/ /td sha256 /fd sha256 /v polaris-engine-installer.exe
pause
