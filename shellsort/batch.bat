@echo off
setlocal enabledelayedexpansion

set arr[0]=64
set arr[1]=34
set arr[2]=25
set arr[3]=12
set arr[4]=22
set arr[5]=11
set arr[6]=90
set n=7

set /a gap=n/2
:gap_loop
if %gap% leq 0 goto print
set /a start=gap
:i_loop
if !start! geq %n% (
    set /a gap=gap/2
    goto gap_loop
)
set temp=!arr[%start%]!
set j=%start%
:j_loop
if %j% lss %gap% goto j_done
set /a jmg=j-gap
if !arr[%jmg%]! leq %temp% goto j_done
set arr[%j%]=!arr[%jmg%]!
set /a j=j-gap
goto j_loop
:j_done
set arr[%j%]=%temp%
set /a start=start+1
goto i_loop

:print
for /l %%i in (0,1,6) do echo !arr[%%i]!
endlocal
