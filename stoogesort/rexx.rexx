arr.1 = 3
arr.2 = 1
arr.3 = 4
arr.4 = 1
arr.5 = 5
arr.6 = 9
arr.7 = 2
arr.8 = 6
n = 8

call stoogesort 1, n

do i = 1 to n
    call charout , arr.i ' '
end
say ''
exit

stoogesort: procedure expose arr.
    arg first, last
    if arr.first > arr.last then do
        tmp = arr.first
        arr.first = arr.last
        arr.last = tmp
    end
    n = last - first + 1
    if n > 2 then do
        t = n * 2 % 3
        call stoogesort first, first + t - 1
        call stoogesort last - t + 1, last
        call stoogesort first, first + t - 1
    end
    return
