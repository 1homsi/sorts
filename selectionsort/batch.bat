@echo off
setlocal enabledelayedexpansion

set arr[0]=5
set arr[1]=3
set arr[2]=1
set arr[3]=4
set arr[4]=2
set n=5

for /l %%i in (0,1,4) do (
    set minIdx=%%i
    set /a ip1=%%i+1
    for /l %%j in (!ip1!,1,4) do (
        if !arr[%%j]! lss !arr[!minIdx!]! set minIdx=%%j
    )
    set tmp=!arr[%%i]!
    set arr[%%i]=!arr[!minIdx!]!
    set arr[!minIdx!]=!tmp!
)

for /l %%i in (0,1,4) do echo !arr[%%i]!
