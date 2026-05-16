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
set arr[9]=0
set n=10
set i=0

:loop
if %i% geq %n% goto done
if %i% equ 0 goto advance
set /a prev=%i%-1
if !arr[%i%]! geq !arr[%prev%]! goto advance
set tmp=!arr[%i%]!
set arr[%i%]=!arr[%prev%]!
set arr[%prev%]=%tmp%
set /a i=%i%-1
goto loop
:advance
set /a i=%i%+1
goto loop

:done
for /l %%k in (0,1,9) do echo !arr[%%k]!
