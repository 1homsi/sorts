class SHELL_SORT

create make

feature
    make
        local
            arr: ARRAY[INTEGER]
            n, gap, i, j, temp: INTEGER
        do
            create arr.make_filled(0, 1, 7)
            arr[1] := 64; arr[2] := 34; arr[3] := 25; arr[4] := 12
            arr[5] := 22; arr[6] := 11; arr[7] := 90
            n := 7
            gap := n // 2
            from until gap = 0 loop
                from i := gap + 1 until i > n loop
                    temp := arr[i]
                    j := i
                    from until j < gap + 1 or arr[j - gap] <= temp loop
                        arr[j] := arr[j - gap]
                        j := j - gap
                    end
                    arr[j] := temp
                    i := i + 1
                end
                gap := gap // 2
            end
            from i := 1 until i > n loop
                io.put_integer(arr[i])
                io.put_character(' ')
                i := i + 1
            end
            io.put_new_line
        end
end
