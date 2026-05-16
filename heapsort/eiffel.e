class HEAPSORT
create make

feature
    arr: ARRAY [INTEGER]

    heapify (n, i: INTEGER)
        local
            largest, left, right, tmp: INTEGER
        do
            largest := i
            left := 2 * i + 1
            right := 2 * i + 2
            if left <= n and then arr [left] > arr [largest] then largest := left end
            if right <= n and then arr [right] > arr [largest] then largest := right end
            if largest /= i then
                tmp := arr [i]; arr [i] := arr [largest]; arr [largest] := tmp
                heapify (n, largest)
            end
        end

    heapsort
        local
            n, i, tmp: INTEGER
        do
            n := arr.count
            from i := n // 2 until i < 1 loop heapify (n, i); i := i - 1 end
            from i := n until i < 2 loop
                tmp := arr [1]; arr [1] := arr [i]; arr [i] := tmp
                heapify (i - 1, 1)
                i := i - 1
            end
        end

    make
        do
            arr := <<12, 11, 13, 5, 6, 7>>
            heapsort
            across arr as c loop io.put_integer (c.item); io.put_character (' ') end
            io.new_line
        end
end
