@echo off
setlocal enabledelayedexpansion

set arr[0]=5
set arr[1]=4
set arr[2]=3
set arr[3]=2
set arr[4]=1
set n=5
set writes=0

for /L %%C in (0,1,3) do (
    set item=!arr[%%C]!
    set pos=%%C
    set /a start=%%C+1
    for /L %%i in (!start!,1,4) do (
        if !arr[%%i]! lss !item! set /a pos+=1
    )
    if !pos! neq %%C (
        :skip_%%C
        if !arr[!pos!]! equ !item! (
            set /a pos+=1
            goto skip_%%C
        )
        set tmp=!arr[!pos!]!
        set arr[!pos!]=!item!
        set item=!tmp!
        set /a writes+=1
    )
)

for /L %%i in (0,1,4) do echo !arr[%%i]!
endlocal
