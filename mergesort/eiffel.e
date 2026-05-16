class MERGE_SORT

create make

feature
    make
        local
            arr: ARRAY[INTEGER]
            sorted: ARRAY[INTEGER]
        do
            create arr.make_filled(0, 1, 7)
            arr[1] := 38; arr[2] := 27; arr[3] := 43; arr[4] := 3
            arr[5] := 9; arr[6] := 82; arr[7] := 10
            sorted := merge_sort(arr, 1, 7)
        end

    merge_sort(a: ARRAY[INTEGER]; lo, hi: INTEGER): ARRAY[INTEGER]
        local
            mid: INTEGER
            left, right: ARRAY[INTEGER]
        do
            if lo >= hi then
                create Result.make_filled(a[lo], 1, 1)
            else
                mid := (lo + hi) // 2
                left := merge_sort(a, lo, mid)
                right := merge_sort(a, mid + 1, hi)
                Result := merge(left, right)
            end
        end

    merge(left, right: ARRAY[INTEGER]): ARRAY[INTEGER]
        local
            i, j, k: INTEGER
        do
            create Result.make_filled(0, 1, left.count + right.count)
            i := 1; j := 1; k := 1
            from until i > left.count or j > right.count loop
                if left[i] <= right[j] then
                    Result[k] := left[i]; i := i + 1
                else
                    Result[k] := right[j]; j := j + 1
                end
                k := k + 1
            end
            from until i > left.count loop
                Result[k] := left[i]; i := i + 1; k := k + 1
            end
            from until j > right.count loop
                Result[k] := right[j]; j := j + 1; k := k + 1
            end
        end
end
