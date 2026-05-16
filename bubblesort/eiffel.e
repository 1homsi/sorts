class
    BUBBLE_SORT

create
    make

feature
    make
        local
            arr: ARRAY [INTEGER]
            n, i, tmp: INTEGER
            swapped: BOOLEAN
        do
            create arr.make_filled (0, 1, 7)
            arr [1] := 64; arr [2] := 34; arr [3] := 25
            arr [4] := 12; arr [5] := 22; arr [6] := 11; arr [7] := 90
            n := arr.count
            from swapped := True until not swapped loop
                swapped := False
                from i := 1 until i >= n loop
                    if arr [i] > arr [i + 1] then
                        tmp := arr [i]
                        arr [i] := arr [i + 1]
                        arr [i + 1] := tmp
                        swapped := True
                    end
                    i := i + 1
                end
                n := n - 1
            end
            from i := 1 until i > 7 loop
                io.put_integer (arr [i])
                io.put_character (' ')
                i := i + 1
            end
            io.put_new_line
        end
end
