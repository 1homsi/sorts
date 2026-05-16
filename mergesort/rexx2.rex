arr.1 = 38; arr.2 = 27; arr.3 = 43; arr.4 = 3
arr.5 = 9;  arr.6 = 82; arr.7 = 10
n = 7
call mergesort 1, n
do i = 1 to n
    say arr.i
end
exit

mergesort: procedure expose arr. tmp.
    parse arg lo, hi
    if lo >= hi then return
    mid = (lo + hi) % 2
    call mergesort lo, mid
    call mergesort mid + 1, hi
    call merge lo, mid, hi
    return

merge: procedure expose arr. tmp.
    parse arg lo, mid, hi
    i = lo; j = mid + 1; k = lo
    do while i <= mid & j <= hi
        if arr.i <= arr.j then do
            tmp.k = arr.i; i = i + 1
        end
        else do
            tmp.k = arr.j; j = j + 1
        end
        k = k + 1
    end
    do while i <= mid
        tmp.k = arr.i; i = i + 1; k = k + 1
    end
    do while j <= hi
        tmp.k = arr.j; j = j + 1; k = k + 1
    end
    do i = lo to hi
        arr.i = tmp.i
    end
    return
