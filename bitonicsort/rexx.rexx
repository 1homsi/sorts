arr.0 = 8
arr.1 = 3; arr.2 = 7; arr.3 = 4; arr.4 = 8
arr.5 = 6; arr.6 = 2; arr.7 = 1; arr.8 = 5

call bitonicSort 1, arr.0, 1

do i = 1 to arr.0
    call charout ,arr.i' '
end
say ''
exit

bitonicSort: procedure expose arr.
    parse arg lo, cnt, dir
    if cnt > 1 then do
        k = cnt % 2
        call bitonicSort lo, k, 1
        call bitonicSort lo + k, k, 0
        call bitonicMerge lo, cnt, dir
    end
    return

bitonicMerge: procedure expose arr.
    parse arg lo, cnt, dir
    if cnt > 1 then do
        k = cnt % 2
        do i = lo to lo + k - 1
            call compareAndSwap i, i + k, dir
        end
        call bitonicMerge lo, k, dir
        call bitonicMerge lo + k, k, dir
    end
    return

compareAndSwap: procedure expose arr.
    parse arg i, j, dir
    if (dir = 1 & arr.i > arr.j) | (dir = 0 & arr.i < arr.j) then do
        tmp = arr.i; arr.i = arr.j; arr.j = tmp
    end
    return
