@echo off
setlocal enabledelayedexpansion

set arr[0]=3
set arr[1]=7
set arr[2]=4
set arr[3]=8
set arr[4]=6
set arr[5]=2
set arr[6]=1
set arr[7]=5

call :bitonicSort 0 8 1

for /l %%i in (0,1,7) do (
    echo !arr[%%i]!
)
exit /b

:compareAndSwap
set i=%1
set j=%2
set dir=%3
set ai=!arr[%i%]!
set aj=!arr[%j%]!
if %dir%==1 (
    if !ai! gtr !aj! (
        set arr[%i%]=!aj!
        set arr[%j%]=!ai!
    )
) else (
    if !ai! lss !aj! (
        set arr[%i%]=!aj!
        set arr[%j%]=!ai!
    )
)
exit /b

:bitonicMerge
set lo=%1
set cnt=%2
set dir=%3
if %cnt% leq 1 exit /b
set /a k=%cnt%/2
for /l %%i in (%lo%,1,0) do (
    set /a j=%%i+%k%
    call :compareAndSwap %%i !j! %dir%
)
set /a lo2=%lo%+%k%
call :bitonicMerge %lo% %k% %dir%
call :bitonicMerge %lo2% %k% %dir%
exit /b

:bitonicSort
set lo=%1
set cnt=%2
set dir=%3
if %cnt% leq 1 exit /b
set /a k=%cnt%/2
set /a lo2=%lo%+%k%
call :bitonicSort %lo% %k% 1
call :bitonicSort %lo2% %k% 0
call :bitonicMerge %lo% %cnt% %dir%
exit /b
