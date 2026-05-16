class SELECTION_SORT
feature
    sort (arr: ARRAY [INTEGER]): ARRAY [INTEGER]
        local
            n, i, j, min_idx, tmp: INTEGER
        do
            n := arr.count
            from i := 1 until i >= n loop
                min_idx := i
                from j := i + 1 until j > n loop
                    if arr [j] < arr [min_idx] then min_idx := j end
                    j := j + 1
                end
                tmp := arr [i]; arr [i] := arr [min_idx]; arr [min_idx] := tmp
                i := i + 1
            end
            Result := arr
        end
end
