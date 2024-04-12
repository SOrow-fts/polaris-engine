!include "MUI2.nsh"
!define MUI_ICON "icon.ico"
!define MUI_UNICON "icon.ico"

Name "Polaris Engine"
OutFile "polaris-engine-installer.exe"
InstallDir "$APPDATA\Local\Polaris Engine"

RequestExecutionLevel user
SetCompressor /SOLID /FINAL lzma
SilentInstall normal

!insertmacro MUI_PAGE_WELCOME
Page directory
Page instfiles

Section "Install"
  SetOutPath "$INSTDIR"
  RMDir /r "$INSTDIR"
  File "polaris-engine.exe"
  File /r "games"
  File /r "tools"
  File "icon.ico"
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  CreateDirectory "$SMPROGRAMS\Polaris Engine"
  CreateShortcut "$SMPROGRAMS\Polaris Engine\Polaris Engine.lnk" "$INSTDIR\polaris-engine.exe" ""
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "InstDir" '"$INSTDIR"'
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "DisplayName" "Polaris Engine"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "DisplayIcon" '"$INSTDIR\icon.ico"'
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "DisplayVersion" "1"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "Publisher" "Keiichi Tabata"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "Contact" "ktabata@polaris-engine.com"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine" "UninstallString" '"$INSTDIR\Uninstall.exe"'
  SetShellVarContext current
  CreateShortCut "$DESKTOP\Polaris Engine.lnk" "$INSTDIR\polaris-engine.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\polaris-engine.exe"
  Delete "$INSTDIR\games"
  Delete "$INSTDIR\tools"
  RMDir /r "$INSTDIR"
  Delete "$SMPROGRAMS\Polaris Engine\Polaris Engine.lnk"
  RMDir "$SMPROGRAMS\Polaris Engine"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine"
  Delete "$DESKTOP\Polaris Engine.lnk"
SectionEnd

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Japanese"
