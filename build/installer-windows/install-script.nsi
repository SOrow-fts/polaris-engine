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
  WriteRegStr HKCU "Software\Classes\.polaris" "" "Polaris.project"
  WriteRegStr HKCU "Software\Classes\Polaris.project" "" "Polaris Engine Project"
  WriteRegStr HKCU "Software\Classes\Polaros.project\DefaultIcon" "" "$INSTDIR\polaris-engine.exe"
  WriteRegStr HKCU "Software\Classes\Polaris.project\Shell\open\command" "" '"$INSTDIR\polaris-engine.exe" "%1"'
  SetShellVarContext current
  CreateShortCut "$DESKTOP\Polaris Engine.lnk" "$INSTDIR\polaris-engine.exe"
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\polaris-engine.exe"
  Delete "$INSTDIR\games"
  Delete "$INSTDIR\tools"
  Delete "$SMPROGRAMS\Polaris Engine\Polaris Engine.lnk"
  RMDir "$SMPROGRAMS\Polaris Engine"
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\Polaris Engine"
  Delete "$DESKTOP\Polaris Engine.lnk"
  DeleteRegKey HKCU "Software\Classes\.polaris"
  DeleteRegKey HKCU "Software\Classes\Polaris.project"
  DeleteRegKey HKCU "Software\Classes\Polaris.project\DefaultIcon"
  DeleteRegKey HKCU "Software\Classes\Polaris.project\Shell\open\command"
SectionEnd

Function .OnInstSuccess
  Exec "$INSTDIR\polaris-engine.exe"
FunctionEnd

!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Japanese"
