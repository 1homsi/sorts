@echo off
setlocal EnableDelayedExpansion

set arr[0]=64
set arr[1]=34
set arr[2]=25
set arr[3]=12
set arr[4]=22
set arr[5]=11
set arr[6]=90
set n=7

:outer
set swapped=0
set /a limit=n-1
for /l %%i in (0,1,%limit%) do (
    set /a j=%%i+1
    if !j! lss %n% (
        if !arr[%%i]! gtr !arr[!j!]! (
            set tmp=!arr[%%i]!
            set arr[%%i]=!arr[!j!]!
            set arr[!j!]=!tmp!
            set swapped=1
        )
    )
)
set /a n-=1
if %swapped%==1 goto outer

for /l %%i in (0,1,6) do echo !arr[%%i]!
endlocal
