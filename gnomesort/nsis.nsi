!include "MUI2.nsh"

Function GnomeSort
  Pop $0
  StrCpy $1 0

  ${While} $1 < 6
    ${If} $1 == 0
      IntOp $1 $1 + 1
    ${Else}
      ${If} $2 < $3
        StrCpy $4 $2
        StrCpy $2 $3
        StrCpy $3 $4
        IntOp $1 $1 - 1
      ${Else}
        IntOp $1 $1 + 1
      ${EndIf}
    ${EndIf}
  ${EndWhile}

  Push $0
FunctionEnd

Section
  Push "5 2 8 1 9 3"
  Call GnomeSort
  Pop $0
  MessageBox MB_OK $0
SectionEnd
