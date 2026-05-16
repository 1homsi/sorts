let
    stoogeSort = arr: first: last:
        let
            a = builtins.elemAt arr first;
            b = builtins.elemAt arr last;
            arr1 = if a > b then
                builtins.genList (i:
                    if i == first then b
                    else if i == last then a
                    else builtins.elemAt arr i
                ) (builtins.length arr)
            else arr;
            n = last - first + 1;
        in
        if n > 2 then
            let
                t = (n * 2) / 3;
                arr2 = stoogeSort arr1 first (first + t - 1);
                arr3 = stoogeSort arr2 (last - t + 1) last;
            in stoogeSort arr3 first (first + t - 1)
        else arr1;
    arr = [3 1 4 1 5 9 2 6];
in stoogeSort arr 0 (builtins.length arr - 1)
