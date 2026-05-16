@echo off
setlocal enabledelayedexpansion

set arr[0]=3
set arr[1]=1
set arr[2]=4
set arr[3]=1
set arr[4]=5
set arr[5]=9
set arr[6]=2
set arr[7]=6
set n=8

:loop
call :is_sorted
if !sorted!==1 goto :print
call :shuffle
goto :loop

:is_sorted
set sorted=1
for /l %%i in (0,1,6) do (
    set /a j=%%i+1
    if !arr[%%i]! gtr !arr[!j!]! set sorted=0
)
exit /b

:shuffle
for /l %%i in (7,-1,1) do (
    set /a j=!random! %% (%%i+1)
    set tmp=!arr[%%i]!
    set arr[%%i]=!arr[!j!]!
    set arr[!j!]=!tmp!
)
exit /b

:print
for /l %%i in (0,1,7) do (
    echo !arr[%%i]!
)
