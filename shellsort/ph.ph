fun shell_sort (arr : array int) : array int =
    let n = Array.length arr
        gap = ref (n / 2)
    in
        while !gap > 0 do
            for i = !gap to n - 1 do
                let temp = Array.get arr i
                    j = ref i
                in
                    while !j >= !gap && Array.get arr (!j - !gap) > temp do
                        Array.set arr !j (Array.get arr (!j - !gap));
                        j := !j - !gap
                    done;
                    Array.set arr !j temp
                end
            done;
            gap := !gap / 2
        done;
        arr
    end

val arr = Array.fromList [64, 34, 25, 12, 22, 11, 90]
val _ = shell_sort arr
val _ = Array.app (fn x => (print (Int.toString x); print " ")) arr
