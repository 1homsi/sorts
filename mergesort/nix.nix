let
    merge = left: right:
        if left == [] then right
        else if right == [] then left
        else
            let lh = builtins.head left;
                rh = builtins.head right;
                lt = builtins.tail left;
                rt = builtins.tail right;
            in
            if lh <= rh then [lh] ++ (merge lt right)
            else [rh] ++ (merge left rt);

    mergeSort = arr:
        let n = builtins.length arr;
        in
        if n <= 1 then arr
        else
            let mid = builtins.div n 2;
                left = mergeSort (builtins.genList (i: builtins.elemAt arr i) mid);
                right = mergeSort (builtins.genList (i: builtins.elemAt arr (mid + i)) (n - mid));
            in merge left right;

in
mergeSort [38 27 43 3 9 82 10]
