class QUICKSORT

create make

feature
    arr: ARRAY[INTEGER]

    make
        do
            create arr.make_filled(0, 1, 7)
            arr.put(3, 1); arr.put(6, 2); arr.put(8, 3); arr.put(10, 4)
            arr.put(1, 5); arr.put(2, 6); arr.put(1, 7)
            quicksort(1, 7)
            across arr as c loop io.put_integer(c.item); io.put_string(" ") end
            io.new_line
        end

    partition(low, high: INTEGER): INTEGER
        local
            pivot, tmp, i, j: INTEGER
        do
            pivot := arr[high]
            i := low
            from j := low until j >= high loop
                if arr[j] <= pivot then
                    tmp := arr[i]; arr.put(arr[j], i); arr.put(tmp, j)
                    i := i + 1
                end
                j := j + 1
            end
            tmp := arr[i]; arr.put(arr[high], i); arr.put(tmp, high)
            Result := i
        end

    quicksort(low, high: INTEGER)
        local
            p: INTEGER
        do
            if low < high then
                p := partition(low, high)
                quicksort(low, p - 1)
                quicksort(p + 1, high)
            end
        end
end
