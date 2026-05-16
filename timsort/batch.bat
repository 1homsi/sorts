@echo off
setlocal enabledelayedexpansion

set arr[0]=5
set arr[1]=2
set arr[2]=8
set arr[3]=1
set arr[4]=9
set arr[5]=3
set arr[6]=7
set arr[7]=4
set arr[8]=6
set n=9
set MIN_RUN=32

set i=0
:run_loop
if %i% geq %n% goto run_done
set /a right=%i%+%MIN_RUN%-1
if %right% geq %n% set /a right=%n%-1
call :insertion_sort %i% %right%
set /a i+=%MIN_RUN%
goto run_loop
:run_done

set size=%MIN_RUN%
:size_loop
if %size% geq %n% goto size_done
set left=0
:left_loop
if %left% geq %n% goto left_done
set /a mid=%left%+%size%-1
if %mid% geq %n% set /a mid=%n%-1
set /a right=%left%+2*%size%-1
if %right% geq %n% set /a right=%n%-1
if %mid% lss %right% call :merge %left% %mid% %right%
set /a left+=%size%*2
goto left_loop
:left_done
set /a size*=2
goto size_loop
:size_done

set out=
for /l %%i in (0,1,8) do set out=!out!!arr[%%i]!
echo !out!
goto :eof

:insertion_sort
set is_l=%1
set is_r=%2
set /a is_i=%is_l%+1
:is_loop
if %is_i% gtr %is_r% goto is_done
set key=!arr[%is_i%]!
set /a is_j=%is_i%-1
:is_inner
if %is_j% lss %is_l% goto is_inner_done
if !arr[%is_j%]! leq %key% goto is_inner_done
set /a is_jp1=%is_j%+1
set arr[!is_jp1!]=!arr[%is_j%]!
set /a is_j-=1
goto is_inner
:is_inner_done
set /a is_jp1=%is_j%+1
set arr[!is_jp1!]=%key%
set /a is_i+=1
goto is_loop
:is_done
goto :eof

:merge
set ml=%1
set mm=%2
set mr=%3
set /a ln=%mm%-%ml%+1
set /a rn=%mr%-%mm%
for /l %%i in (0,1,%ln%) do (
    set /a idx=%ml%+%%i
    set lp[%%i]=!arr[!idx!]!
)
for /l %%i in (0,1,%rn%) do (
    set /a idx=%mm%+1+%%i
    set rp[%%i]=!arr[!idx!]!
)
set mi=0
set mj=0
set mk=%ml%
:merge_main
if %mi% geq %ln% goto merge_left
if %mj% geq %rn% goto merge_left
if !lp[%mi%]! leq !rp[%mj%]! (
    set arr[%mk%]=!lp[%mi%]!
    set /a mi+=1
) else (
    set arr[%mk%]=!rp[%mj%]!
    set /a mj+=1
)
set /a mk+=1
goto merge_main
:merge_left
if %mi% geq %ln% goto merge_right
set arr[%mk%]=!lp[%mi%]!
set /a mi+=1
set /a mk+=1
goto merge_left
:merge_right
if %mj% geq %rn% goto merge_done
set arr[%mk%]=!rp[%mj%]!
set /a mj+=1
set /a mk+=1
goto merge_right
:merge_done
goto :eof
