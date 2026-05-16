class PANCAKE_SORT

create make

feature {NONE}
    arr: ARRAY [INTEGER]

    flip (k: INTEGER)
        local
            left, right, tmp: INTEGER
        do
            left := 1
            right := k + 1
            from until left >= right loop
                tmp := arr [left]
                arr [left] := arr [right]
                arr [right] := tmp
                left := left + 1
                right := right - 1
            end
        end

    find_max_idx (size: INTEGER): INTEGER
        local
            i, max_idx: INTEGER
        do
            max_idx := 1
            from i := 2 until i > size loop
                if arr [i] > arr [max_idx] then
                    max_idx := i
                end
                i := i + 1
            end
            Result := max_idx
        end

    pancake_sort
        local
            size, max_idx: INTEGER
        do
            from size := arr.count until size <= 1 loop
                max_idx := find_max_idx (size)
                if max_idx /= size then
                    if max_idx /= 1 then flip (max_idx - 1) end
                    flip (size - 1)
                end
                size := size - 1
            end
        end

feature
    make
        do
            arr := <<3, 6, 2, 7, 4, 1, 5>>
            pancake_sort
            across arr as c loop
                io.put_integer (c.item)
                io.put_string (" ")
            end
            io.new_line
        end
end
