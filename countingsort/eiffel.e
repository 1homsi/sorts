class COUNTING_SORT
create make
feature
    make
        local
            arr: ARRAY [INTEGER]
            sorted: ARRAY [INTEGER]
        do
            create arr.make_from_array (<<4, 2, 2, 8, 3, 3, 1>>)
            sorted := sort(arr)
            across sorted as v loop
                io.put_integer(v.item)
                io.put_character(' ')
            end
            io.new_line
        end

    sort(arr: ARRAY [INTEGER]): ARRAY [INTEGER]
        local
            n, mn, mx, rng, i, v, idx: INTEGER
            cnt, output: ARRAY [INTEGER]
        do
            n := arr.count
            mn := arr[1]; mx := arr[1]
            across arr as a loop
                if a.item < mn then mn := a.item end
                if a.item > mx then mx := a.item end
            end
            rng := mx - mn + 1
            create cnt.make_filled(0, 0, rng - 1)
            create output.make_filled(0, 1, n)
            across arr as a loop cnt[a.item - mn] := cnt[a.item - mn] + 1 end
            from i := 1 until i >= rng loop
                cnt[i] := cnt[i] + cnt[i - 1]; i := i + 1
            end
            from i := n until i < 1 loop
                v := arr[i]; idx := v - mn
                cnt[idx] := cnt[idx] - 1
                output[cnt[idx] + 1] := v
                i := i - 1
            end
            Result := output
        end
end
