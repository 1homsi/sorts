class STOOGE_SORT

create make

feature
    arr: ARRAY [INTEGER]

    stooge_sort (first, last: INTEGER)
        local
            tmp, t, n: INTEGER
        do
            if arr [first] > arr [last] then
                tmp := arr [first]
                arr [first] := arr [last]
                arr [last] := tmp
            end
            n := last - first + 1
            if n > 2 then
                t := n * 2 // 3
                stooge_sort (first, first + t - 1)
                stooge_sort (last - t + 1, last)
                stooge_sort (first, first + t - 1)
            end
        end

    make
        do
            arr := <<3, 1, 4, 1, 5, 9, 2, 6>>
            stooge_sort (1, arr.count)
            across arr as c loop io.put_integer (c.item) io.put_character (' ') end
            io.put_new_line
        end
end
