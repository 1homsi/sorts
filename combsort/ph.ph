pH comb_sort (arr : int array) : int array =
    let n = Array.length arr
        gap = ref n
        sorted = ref false
    in
        while !sorted = false do
            gap := max 1 (int_of_float (float_of_int !gap /. 1.3));
            if !gap <= 1 then (gap := 1; sorted := true);
            let i = ref 0 in
            while !i + !gap < n do
                if arr.(!i) > arr.(!i + !gap) then begin
                    let tmp = arr.(!i) in
                    arr.(!i) <- arr.(!i + !gap);
                    arr.(!i + !gap) <- tmp;
                    sorted := false
                end;
                incr i
            done
        done;
        arr
