class COMB_SORT

feature
    sort (arr: ARRAY [INTEGER])
        local
            n, gap, i, tmp: INTEGER
            sorted: BOOLEAN
        do
            n := arr.count
            gap := n
            sorted := False
            from until sorted loop
                gap := (gap / 1.3).truncated_to_integer
                if gap <= 1 then
                    gap := 1
                    sorted := True
                end
                from i := 1 until i > n - gap loop
                    if arr [i] > arr [i + gap] then
                        tmp := arr [i]
                        arr [i] := arr [i + gap]
                        arr [i + gap] := tmp
                        sorted := False
                    end
                    i := i + 1
                end
            end
        end

end
