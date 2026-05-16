gnome_sort: procedure expose arr. n
    i = 1
    do while i <= n
        if i = 1 | arr.i >= arr.(i-1) then
            i = i + 1
        else do
            tmp = arr.i
            arr.i = arr.(i-1)
            arr.(i-1) = tmp
            i = i - 1
        end
    end
return
