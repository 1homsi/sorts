@echo off
setlocal enabledelayedexpansion

set arr[0]=5
set arr[1]=3
set arr[2]=8
set arr[3]=1
set arr[4]=9
set arr[5]=2
set arr[6]=7
set arr[7]=4
set arr[8]=6
set n=9

call :combsort %n%
goto :eof

:combsort
set /a gap=%1
set sorted=0
:outer
if %sorted%==1 goto :done
set /a gap=gap*10/13
if %gap% leq 1 (
    set gap=1
    set sorted=1
)
set changed=0
set /a limit=n-gap-1
for /l %%i in (0,1,%limit%) do (
    set /a j=%%i+gap
    set a=!arr[%%i]!
    set b=!arr[!j!]!
    if !a! gtr !b! (
        set arr[%%i]=!b!
        set arr[!j!]=!a!
        set sorted=0
        set changed=1
    )
)
if %gap%==1 if %changed%==0 set sorted=1
goto :outer
:done
exit /b
