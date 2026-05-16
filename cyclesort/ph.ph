fun cycle_sort(arr: int array, n: int): unit =
    let
        val writes = ref 0
    in
        for cs = 0 to n - 2 do
            let
                val item = ref (Array.sub(arr, cs))
                val pos = ref cs
            in
                for i = cs + 1 to n - 1 do
                    if Array.sub(arr, i) < !item then
                        pos := !pos + 1
                done;
                if !pos <> cs then begin
                    while !item = Array.sub(arr, !pos) do
                        pos := !pos + 1
                    done;
                    let val tmp = Array.sub(arr, !pos) in
                        Array.update(arr, !pos, !item);
                        item := tmp
                    end;
                    writes := !writes + 1;
                    while !pos <> cs do
                        pos := cs;
                        for i = cs + 1 to n - 1 do
                            if Array.sub(arr, i) < !item then
                                pos := !pos + 1
                        done;
                        while !item = Array.sub(arr, !pos) do
                            pos := !pos + 1
                        done;
                        let val t = Array.sub(arr, !pos) in
                            Array.update(arr, !pos, !item);
                            item := t
                        end;
                        writes := !writes + 1
                    done
                end
            end
        done
    end

val arr = Array.fromList [5, 4, 3, 2, 1]
val () = cycle_sort(arr, 5)
val () = Array.app (fn x => print(Int.toString x ^ " ")) arr
val () = print "\n"
