@echo off
setlocal enabledelayedexpansion

set arr[0]=38
set arr[1]=27
set arr[2]=43
set arr[3]=3
set arr[4]=9
set arr[5]=82
set arr[6]=10
set n=7

call :mergesort 0 6

set output=
for /l %%i in (0,1,6) do set output=!output!!arr[%%i]!
echo !output!
goto :eof

:mergesort
set lo=%1
set hi=%2
if %lo% geq %hi% goto :eof
set /a mid=(%lo%+%hi%)/2
call :mergesort %lo% %mid%
set /a midp1=%mid%+1
call :mergesort %midp1% %hi%
call :merge %lo% %mid% %hi%
goto :eof

:merge
set lo=%1
set mid=%2
set hi=%3
set i=%lo%
set /a j=%mid%+1
set k=%lo%
:merge_loop
if %i% gtr %mid% goto :merge_right
if %j% gtr %hi% goto :merge_left
if !arr[%i%]! leq !arr[%j%]! (
    set tmp[%k%]=!arr[%i%]!
    set /a i+=1
) else (
    set tmp[%k%]=!arr[%j%]!
    set /a j+=1
)
set /a k+=1
goto :merge_loop
:merge_left
set tmp[%k%]=!arr[%i%]!
set /a i+=1
set /a k+=1
if %i% leq %mid% goto :merge_left
goto :merge_copy
:merge_right
set tmp[%k%]=!arr[%j%]!
set /a j+=1
set /a k+=1
if %j% leq %hi% goto :merge_right
:merge_copy
for /l %%x in (%lo%,1,%hi%) do set arr[%%x]=!tmp[%%x]!
goto :eof
