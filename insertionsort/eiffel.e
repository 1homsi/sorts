class INSERTION_SORT

feature
    sort (arr: ARRAY [INTEGER])
        local
            n, i, j, key: INTEGER
        do
            n := arr.count
            from i := 2 until i > n loop
                key := arr [i]
                j := i - 1
                from until j < 1 or arr [j] <= key loop
                    arr [j + 1] := arr [j]
                    j := j - 1
                end
                arr [j + 1] := key
                i := i + 1
            end
        end

end
