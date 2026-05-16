let gnome_sort [n] (arr: [n]i32) : [n]i32 =
    let arr_ref = copy arr
    let (result, _) = loop (a, i) = (arr_ref, 0) while i < n do
        if i == 0 || a[i] >= a[i-1]
        then (a, i + 1)
        else
            let tmp = a[i]
            let a' = a with [i] = a[i-1]
            let a'' = a' with [i-1] = tmp
            in (a'', i - 1)
    in result
