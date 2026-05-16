@echo off
setlocal enabledelayedexpansion
set n=10
set gap=%n:~0,1%
for /L %%i in (%gap%,1,%n%) do (
    if %%i GEQ %gap% (
        set temp=!arr[%%i]!
        set j=%%i
        for /L %%j in (%j%,-1,0) do (
            if !j! GEQ %gap% (
                if !arr[!j!-!gap!]! GTR !temp! (
                    set arr[!j!]=!arr[!j!-!gap!]!
                    set /a j-=%gap%
                )
            )
        )
        set arr[!j!]=!temp!
    )
)
set /a gap=%gap%/2
