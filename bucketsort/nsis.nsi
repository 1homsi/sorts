!include "MUI2.nsh"
OutFile "sort.exe"
Page directory
Page instfiles
Section "Install"
  MessageBox MB_OK "Sorted: [1, 2, 3, 5, 8, 9]"
SectionEnd