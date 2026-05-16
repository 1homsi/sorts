!include "MUI2.nsh"

!insertmacro MUI_LANGUAGE "English"

Name "CycleSort"
OutFile "cyclesort.exe"

Page instfiles
PageEx instfiles
  PageCallbacks "" "" ""
PageExEnd

Section "Install"
  DetailPrint "CycleSort: [5,2,8,1,9,3]"
SectionEnd
