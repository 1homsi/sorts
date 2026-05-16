@echo off
setlocal enabledelayedexpansion

set arr[0]=5
set arr[1]=3
set arr[2]=1
set arr[3]=4
set arr[4]=2
set n=5

for /l %%i in (1,1,4) do (
    set /a key=arr[%%i]
    set key=!arr[%%i]!
    set /a j=%%i-1
    :inner
    if !j! geq 0 (
        if !arr[!j!]! gtr !key! (
            set /a jp1=!j!+1
            set arr[!jp1!]=!arr[!j!]!
            set /a j-=1
            goto :inner
        )
    )
    set /a jp1=!j!+1
    set arr[!jp1!]=!key!
)
