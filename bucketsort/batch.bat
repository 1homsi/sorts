@echo off
setlocal enabledelayedexpansion

set arr[0]=78
set arr[1]=17
set arr[2]=39
set arr[3]=26
set arr[4]=72
set arr[5]=94
set arr[6]=21
set arr[7]=12
set arr[8]=23
set arr[9]=68
set n=10

set minV=!arr[0]!
set maxV=!arr[0]!
for /l %%i in (0,1,9) do (
    if !arr[%%i]! lss !minV! set minV=!arr[%%i]!
    if !arr[%%i]! gtr !maxV! set maxV=!arr[%%i]!
)

set range=0
set /a range=maxV-minV+1

for /l %%b in (0,1,9) do set cnt[%%b]=0

for /l %%i in (0,1,9) do (
    set /a idx="(arr[%%i]-minV)*n/range"
    if !idx! geq %n% set idx=9
    set b=!idx!
    set c=!cnt[!b!]!
    set bkt[!b!][!c!]=!arr[%%i]!
    set /a cnt[!b!]+=1
)

set pos=0
for /l %%b in (0,1,9) do (
    set m=!cnt[%%b]!
    for /l %%i in (1,1,!m!) do (
        set /a im1=%%i-1
        if !bkt[%%b][%%i]! lss !bkt[%%b][!im1!]! (
            set tmp=!bkt[%%b][%%i]!
            set bkt[%%b][%%i]=!bkt[%%b][!im1!]!
            set bkt[%%b][!im1!]=!tmp!
        )
    )
    for /l %%i in (0,1,!m!) do (
        if %%i lss !m! (
            set arr[!pos!]=!bkt[%%b][%%i]!
            set /a pos+=1
        )
    )
)

for /l %%i in (0,1,9) do echo !arr[%%i]!
endlocal
