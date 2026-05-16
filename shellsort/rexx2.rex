arr.1 = 64; arr.2 = 34; arr.3 = 25; arr.4 = 12
arr.5 = 22; arr.6 = 11; arr.7 = 90
n = 7
gap = n % 2
do while gap > 0
    do i = gap + 1 to n
        temp = arr.i
        j = i
        do while j > gap & arr.(j - gap) > temp
            arr.j = arr.(j - gap)
            j = j - gap
        end
        arr.j = temp
    end
    gap = gap % 2
end
do i = 1 to n
    call charout , arr.i ' '
end
say ''
