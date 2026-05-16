/* REXX Comb Sort */
comb_sort: procedure expose arr.
    parse arg n
    gap = n
    sorted = 0
    do while sorted = 0
        gap = trunc(gap / 1.3)
        if gap <= 1 then do
            gap = 1
            sorted = 1
        end
        do i = 1 to n - gap
            j = i + gap
            if arr.i > arr.j then do
                tmp = arr.i
                arr.i = arr.j
                arr.j = tmp
                sorted = 0
            end
        end
    end
    return
