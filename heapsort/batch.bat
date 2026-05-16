@echo off
setlocal enabledelayedexpansion

set arr[0]=12
set arr[1]=11
set arr[2]=13
set arr[3]=5
set arr[4]=6
set arr[5]=7
set n=6

set /a start=n/2-1
for /l %%i in (%start%,-1,0) do call :heapify %n% %%i

set /a last=n-1
for /l %%i in (%last%,-1,1) do (
    set tmp=!arr[0]!
    set arr[0]=!arr[%%i]!
    set arr[%%i]=!tmp!
    call :heapify %%i 0
)

for /l %%i in (0,1,5) do echo !arr[%%i]!
goto :eof

:heapify
set pn=%1
set pi=%2
set largest=%pi%
set /a left=2*pi+1
set /a right=2*pi+2
if %left% lss %pn% (
    if !arr[%left%]! gtr !arr[%largest%]! set largest=%left%
)
if %right% lss %pn% (
    if !arr[%right%]! gtr !arr[%largest%]! set largest=%right%
)
if %largest% neq %pi% (
    set tmp=!arr[%pi%]!
    set arr[%pi%]=!arr[%largest%]!
    set arr[%largest%]=%tmp%
    call :heapify %pn% %largest%
)
goto :eof
