!include "MUI2.nsh"

Name "TimSort"
OutFile "timsort.exe"

Function TimSort
  Push 32
  Push 5
  Push 2
  Push 8
  Push 1
  Push 9
  Push 3
  MessageBox MB_OK "TimSort Example"
FunctionEnd

Section "Install"
  Call TimSort
SectionEnd
