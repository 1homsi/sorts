class
    TIMSORT

create
    make

feature {NONE}
    min_run: INTEGER = 32

feature
    make
        local
            arr: ARRAY [INTEGER]
        do
            arr := <<5, 2, 8, 1, 9, 3, 7, 4, 6>>
            timsort(arr)
            across arr as c loop
                io.put_integer(c.item)
                io.put_character(' ')
            end
            io.new_line
        end

    insertion_sort(arr: ARRAY [INTEGER]; left, right: INTEGER)
        local
            i, j, key: INTEGER
        do
            from i := left + 1 until i > right loop
                key := arr[i]
                j := i - 1
                from until j < left or else arr[j] <= key loop
                    arr[j + 1] := arr[j]
                    j := j - 1
                end
                arr[j + 1] := key
                i := i + 1
            end
        end

    merge(arr: ARRAY [INTEGER]; left, mid, right: INTEGER)
        local
            ln, rn, i, j, k: INTEGER
            lp, rp: ARRAY [INTEGER]
        do
            ln := mid - left + 1
            rn := right - mid
            create lp.make_filled(0, 1, ln)
            create rp.make_filled(0, 1, rn)
            from i := 1 until i > ln loop lp[i] := arr[left + i - 1]; i := i + 1 end
            from i := 1 until i > rn loop rp[i] := arr[mid + i]; i := i + 1 end
            i := 1; j := 1; k := left
            from until i > ln or j > rn loop
                if lp[i] <= rp[j] then arr[k] := lp[i]; i := i + 1
                else arr[k] := rp[j]; j := j + 1 end
                k := k + 1
            end
            from until i > ln loop arr[k] := lp[i]; i := i + 1; k := k + 1 end
            from until j > rn loop arr[k] := rp[j]; j := j + 1; k := k + 1 end
        end

    timsort(arr: ARRAY [INTEGER])
        local
            n, i, size, left, mid, right: INTEGER
        do
            n := arr.count
            from i := 1 until i > n loop
                insertion_sort(arr, i, (i + min_run - 1).min(n))
                i := i + min_run
            end
            from size := min_run until size >= n loop
                from left := 1 until left > n loop
                    mid := (left + size - 1).min(n)
                    right := (left + 2 * size - 1).min(n)
                    if mid < right then merge(arr, left, mid, right) end
                    left := left + 2 * size
                end
                size := size * 2
            end
        end

end
