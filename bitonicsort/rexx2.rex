arr.0 = 8
arr.1 = 3; arr.2 = 7; arr.3 = 4; arr.4 = 8
arr.5 = 6; arr.6 = 2; arr.7 = 1; arr.8 = 5

call BitonicSort 1, 8, 1

do i = 1 to 8
    call charout , arr.i ' '
end
say

exit

BitonicSort: procedure expose arr.
    parse arg lo, cnt, dir
    if cnt > 1 then do
        k = cnt % 2
        call BitonicSort lo, k, 1
        call BitonicSort lo + k, k, 0
        call BitonicMerge lo, cnt, dir
    end
return

BitonicMerge: procedure expose arr.
    parse arg lo, cnt, dir
    if cnt > 1 then do
        k = cnt % 2
        do i = lo to lo + k - 1
            call CompareSwap i, i + k, dir
        end
        call BitonicMerge lo, k, dir
        call BitonicMerge lo + k, k, dir
    end
return

CompareSwap: procedure expose arr.
    parse arg i, j, dir
    if (dir & arr.i > arr.j) | (\dir & arr.i < arr.j) then do
        tmp = arr.i; arr.i = arr.j; arr.j = tmp
    end
return
