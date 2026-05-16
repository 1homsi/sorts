!include "MUI2.nsh"

Name "Counting Sort"
OutFile "countingsort.exe"

!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_LANGUAGE "English"

Section "Install"
  StrCpy $0 "5 2 8 1 9 3"
  StrCpy $1 9
  StrCpy $2 ""

  StrLen $3 $0
  StrCpy $4 0

  IntOp $4 $4 + 1
  ${While} $4 <= $1
    StrCpy $5 0
    StrCpy $6 ""
    ${While} $5 < $3
      StrCpy $7 $0 1 $5
      ${If} $7 == $4
        StrCpy $2 "$2 $4"
      ${EndIf}
      IntOp $5 $5 + 1
    ${EndWhile}
    IntOp $4 $4 + 1
  ${EndWhile}

  DetailPrint "Sorted: $2"
SectionEnd
