class BITONIC_SORT

create make

feature
    arr: ARRAY [INTEGER]

    make
        do
            create arr.make_filled(0, 1, 8)
            arr[1] := 3; arr[2] := 7; arr[3] := 4; arr[4] := 8
            arr[5] := 6; arr[6] := 2; arr[7] := 1; arr[8] := 5
            bitonic_sort(1, 8, True)
            across arr as a loop io.put_integer(a.item); io.put_character(' ') end
            io.new_line
        end

    compare_and_swap(i, j: INTEGER; direction: BOOLEAN)
        local tmp: INTEGER
        do
            if direction = (arr[i] > arr[j]) then
                tmp := arr[i]; arr[i] := arr[j]; arr[j] := tmp
            end
        end

    bitonic_merge(lo, cnt: INTEGER; direction: BOOLEAN)
        local k, i: INTEGER
        do
            if cnt > 1 then
                k := cnt // 2
                from i := lo until i >= lo + k loop
                    compare_and_swap(i, i + k, direction)
                    i := i + 1
                end
                bitonic_merge(lo, k, direction)
                bitonic_merge(lo + k, k, direction)
            end
        end

    bitonic_sort(lo, cnt: INTEGER; direction: BOOLEAN)
        local k: INTEGER
        do
            if cnt > 1 then
                k := cnt // 2
                bitonic_sort(lo, k, True)
                bitonic_sort(lo + k, k, False)
                bitonic_merge(lo, cnt, direction)
            end
        end

end
