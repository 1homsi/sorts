class BOGOSORT

create make

feature
    arr: ARRAY [INTEGER]
    n: INTEGER

    make
        do
            n := 8
            create arr.make_filled (0, 1, n)
            arr[1] := 3; arr[2] := 1; arr[3] := 4; arr[4] := 1
            arr[5] := 5; arr[6] := 9; arr[7] := 2; arr[8] := 6
            from until is_sorted loop shuffle end
            across arr as c loop io.put_integer (c.item); io.put_character (' ') end
            io.new_line
        end

    is_sorted: BOOLEAN
        local i: INTEGER
        do
            Result := True
            from i := 1 until i > n - 1 or not Result loop
                if arr[i] > arr[i + 1] then Result := False end
                i := i + 1
            end
        end

    shuffle
        local
            i, j, tmp: INTEGER
            r: RANDOM
        do
            create r.make
            r.start
            from i := n until i <= 1 loop
                r.forth
                j := (r.item \\ i) + 1
                tmp := arr[i]
                arr[i] := arr[j]
                arr[j] := tmp
                i := i - 1
            end
        end
end
