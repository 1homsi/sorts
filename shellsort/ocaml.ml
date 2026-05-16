let shellsort arr =
    let n = Array.length arr in
    let gap = ref (n / 2) in
    while !gap > 0 do
        for i = !gap to n - 1 do
            let temp = arr.(i) in
            let j = ref i in
            while !j >= !gap && arr.(!j - !gap) > temp do
                arr.(!j) <- arr.(!j - !gap);
                j := !j - !gap
            done;
            arr.(!j) <- temp
        done;
        gap := !gap / 2
    done;
    arr
