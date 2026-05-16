@echo off
setlocal enabledelayedexpansion

set arr[0]=170
set arr[1]=45
set arr[2]=75
set arr[3]=90
set arr[4]=802
set arr[5]=24
set arr[6]=2
set arr[7]=66
set n=8

set maxVal=!arr[0]!
for /l %%i in (1,1,7) do (
    if !arr[%%i]! gtr !maxVal! set maxVal=!arr[%%i]!
)

set exp=1
:exploop
set /a check=maxVal/exp
if !check! leq 0 goto done

for /l %%i in (0,1,9) do set count[%%i]=0

for /l %%i in (0,1,7) do (
    set /a val=arr[%%i]
    set /a idx=val/exp %% 10
    set /a count[!idx!]+=1
)

for /l %%i in (1,1,9) do (
    set /a prev=%%i-1
    set /a count[%%i]+=count[!prev!]
)

for /l %%i in (7,-1,0) do (
    set /a val=arr[%%i]
    set /a idx=val/exp %% 10
    set /a count[!idx!]-=1
    set /a pos=count[!idx!]
    set out[!pos!]=!val!
)

for /l %%i in (0,1,7) do set arr[%%i]=!out[%%i]!

set /a exp*=10
goto exploop

:done
set result=
for /l %%i in (0,1,7) do set result=!result! !arr[%%i]!
echo !result!
endlocal
