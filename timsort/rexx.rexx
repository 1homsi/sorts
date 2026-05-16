/* REXX Timsort */
MIN_RUN = 32
n = 9
arr.1 = 5; arr.2 = 2; arr.3 = 8; arr.4 = 1; arr.5 = 9
arr.6 = 3; arr.7 = 7; arr.8 = 4; arr.9 = 6

i = 1
do while i <= n
    right = i + MIN_RUN - 1
    if right > n then right = n
    call insertion_sort i, right
    i = i + MIN_RUN
end

sz = MIN_RUN
do while sz < n
    left = 1
    do while left <= n
        mid = left + sz - 1
        if mid > n then mid = n
        right = left + 2*sz - 1
        if right > n then right = n
        if mid < right then call merge_runs left, mid, right
        left = left + 2*sz
    end
    sz = sz * 2
end

out = ''
do i = 1 to n
    out = out arr.i
end
say out
exit

insertion_sort: procedure expose arr.
    parse arg left, right
    do i = left + 1 to right
        key = arr.i
        j = i - 1
        do while j >= left & arr.j > key
            arr.(j+1) = arr.j
            j = j - 1
        end
        arr.(j+1) = key
    end
    return

merge_runs: procedure expose arr.
    parse arg left, mid, right
    ln = mid - left + 1
    rn = right - mid
    do i = 1 to ln
        lp.i = arr.(left + i - 1)
    end
    do i = 1 to rn
        rp.i = arr.(mid + i)
    end
    i = 1; j = 1; k = left
    do while i <= ln & j <= rn
        if lp.i <= rp.j then do
            arr.k = lp.i; i = i + 1
        end
        else do
            arr.k = rp.j; j = j + 1
        end
        k = k + 1
    end
    do while i <= ln; arr.k = lp.i; i = i+1; k = k+1; end
    do while j <= rn; arr.k = rp.j; j = j+1; k = k+1; end
    return
