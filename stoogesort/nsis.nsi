!include "x64.nsh"

Name "StoogeSort"
OutFile "stoogesort.exe"

Section "Install"
  StrCpy $0 "5"
  StrCpy $1 "2"
  StrCpy $2 "8"
  MessageBox MB_OK "StoogeSort: $0$1$2"
SectionEnd
