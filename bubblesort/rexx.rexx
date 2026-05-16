arr.1 = 64; arr.2 = 34; arr.3 = 25; arr.4 = 12
arr.5 = 22; arr.6 = 11; arr.7 = 90
n = 7
swapped = 1
do while swapped = 1
    swapped = 0
    do i = 1 to n - 1
        if arr.i > arr.(i+1) then do
            tmp = arr.i
            arr.i = arr.(i+1)
            arr.(i+1) = tmp
            swapped = 1
        end
    end
    n = n - 1
end
do i = 1 to 7
    say arr.i
end
