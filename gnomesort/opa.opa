gnome_sort(arr: list(int)): list(int) =
    n = List.length(arr)
    a = Array.of_list(arr)
    rec loop(i: int) =
        if i >= n then void
        else if i == 0 || a[i] >= a[i-1] then loop(i+1)
        else
            tmp = a[i]
            a[i] := a[i-1]
            a[i-1] := tmp
            loop(i-1)
    loop(0)
    Array.to_list(a)
