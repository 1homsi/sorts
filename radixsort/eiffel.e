class RADIX_SORT

create make

feature
    make
        local
            arr: ARRAY[INTEGER]
        do
            create arr.make_from_array(<<170, 45, 75, 90, 802, 24, 2, 66>>)
            radix_sort(arr)
            across arr as c loop io.put_integer(c.item) io.put_character(' ') end
            io.new_line
        end

    counting_sort(arr: ARRAY[INTEGER]; exp: INTEGER)
        local
            n, i, idx: INTEGER
            output: ARRAY[INTEGER]
            count: ARRAY[INTEGER]
        do
            n := arr.count
            create output.make_filled(0, 1, n)
            create count.make_filled(0, 0, 9)
            from i := 1 until i > n loop
                idx := (arr[i] // exp) \\ 10
                count[idx] := count[idx] + 1
                i := i + 1
            end
            from i := 1 until i > 9 loop
                count[i] := count[i] + count[i-1]
                i := i + 1
            end
            from i := n until i < 1 loop
                idx := (arr[i] // exp) \\ 10
                output[count[idx]] := arr[i]
                count[idx] := count[idx] - 1
                i := i - 1
            end
            from i := 1 until i > n loop
                arr[i] := output[i]
                i := i + 1
            end
        end

    radix_sort(arr: ARRAY[INTEGER])
        local
            max_val, exp, i: INTEGER
        do
            if arr.count = 0 then return end
            max_val := arr[1]
            from i := 2 until i > arr.count loop
                if arr[i] > max_val then max_val := arr[i] end
                i := i + 1
            end
            from exp := 1 until max_val // exp = 0 loop
                counting_sort(arr, exp)
                exp := exp * 10
            end
        end
end
