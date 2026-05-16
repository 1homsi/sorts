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

set swapped=1
set start=0
set /a end=n-1

:outer
if !swapped!==0 goto done
set swapped=0
set i=!start!
:forward
if !i! geq !end! goto after_forward
set /a i1=i+1
if !arr[%i%]! gtr !arr[%i1%]! (
    set tmp=!arr[%i%]!
    set arr[%i%]=!arr[%i1%]!
    set arr[%i1%]=!tmp!
    set swapped=1
)
set /a i+=1
goto forward
:after_forward
if !swapped!==0 goto done
set swapped=0
set /a end-=1
set /a i=end-1
:backward
if !i! lss !start! goto after_backward
set /a i1=i+1
if !arr[%i%]! gtr !arr[%i1%]! (
    set tmp=!arr[%i%]!
    set arr[%i%]=!arr[%i1%]!
    set arr[%i1%]=!tmp!
    set swapped=1
)
set /a i-=1
goto backward
:after_backward
set /a start+=1
goto outer

:done
endlocal
