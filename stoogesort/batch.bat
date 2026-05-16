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

call :stoogeSort 0 7

for /L %%i in (0,1,7) do echo !arr[%%i]!
goto :eof

:stoogeSort
set /a first=%1, last=%2
set /a n=last-first+1
if !arr[%first%]! GTR !arr[%last%]! (
    set /a tmp=arr[%first%]
    set arr[%first%]=!arr[%last%]!
    set arr[%last%]=!tmp!
)
if %n% GTR 2 (
    set /a t=n*2/3
    set /a m1=first+t-1
    set /a m2=last-t+1
    call :stoogeSort %first% !m1!
    call :stoogeSort !m2! %last%
    call :stoogeSort %first% !m1!
)
goto :eof
