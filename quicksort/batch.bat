@echo off
setlocal enabledelayedexpansion

set arr[0]=3
set arr[1]=6
set arr[2]=8
set arr[3]=10
set arr[4]=1
set arr[5]=2
set arr[6]=1
set n=7

call :quicksort 0 6

set output=
for /l %%i in (0,1,6) do set output=!output!!arr[%%i]!
echo !output!
goto :eof

:quicksort
set low=%1
set high=%2
if %low% geq %high% goto :eof
call :partition %low% %high% p
set /a pm1=p-1
set /a pp1=p+1
call :quicksort %low% %pm1%
call :quicksort %pp1% %high%
goto :eof

:partition
set low=%1
set high=%2
set pivot=!arr[%high%]!
set i=%low%
for /l %%j in (%low%,1,%high%) do (
    if %%j neq %high% (
        set v=!arr[%%j]!
        if !v! leq !pivot! (
            set ti=!arr[%i%]!
            set arr[%i%]=!arr[%%j]!
            set arr[%%j]=!ti!
            set /a i+=1
        )
    )
)
set ti=!arr[%i%]!
set arr[%i%]=!arr[%high%]!
set arr[%high%]=!ti!
set %3=%i%
goto :eof
