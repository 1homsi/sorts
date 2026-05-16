@echo off
setlocal enabledelayedexpansion

set arr[0]=3
set arr[1]=6
set arr[2]=2
set arr[3]=7
set arr[4]=4
set arr[5]=1
set arr[6]=5
set n=7

set size=7
:outer
if %size% leq 1 goto done
set maxIdx=0
set /a sizelim=size-1
for /l %%i in (1,1,%sizelim%) do (
    if !arr[%%i]! gtr !arr[%maxIdx%]! set maxIdx=%%i
)
set /a target=size-1
if %maxIdx% neq %target% (
    if %maxIdx% neq 0 call :flip %maxIdx%
    call :flip %target%
)
set /a size=size-1
goto outer

:flip
set /a k=%1
set left=0
set right=%k%
:fliploop
if %left% geq %right% goto flipdone
set tmp=!arr[%left%]!
set arr[%left%]=!arr[%right%]!
set arr[%right%]=%tmp%
set /a left=left+1
set /a right=right-1
goto fliploop
:flipdone
exit /b

:done
for /l %%i in (0,1,6) do echo !arr[%%i%]!
endlocal
