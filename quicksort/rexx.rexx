arr.0 = 7
arr.1 = 3; arr.2 = 6; arr.3 = 8; arr.4 = 10
arr.5 = 1; arr.6 = 2; arr.7 = 1
call quicksort 1, 7
do i = 1 to 7
    say arr.i
end
exit

quicksort: procedure expose arr.
    parse arg low, high
    if low >= high then return
    p = partition(low, high)
    call quicksort low, p - 1
    call quicksort p + 1, high
    return

partition: procedure expose arr.
    parse arg low, high
    pivot = arr.high
    i = low
    do j = low to high - 1
        if arr.j <= pivot then do
            tmp = arr.i; arr.i = arr.j; arr.j = tmp
            i = i + 1
        end
    end
    tmp = arr.i; arr.i = arr.high; arr.high = tmp
    return i
