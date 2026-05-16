TimSort := Object clone do(
    minRun := 32

    insertionSort := method(arr, left, right,
        i := left + 1
        while(i <= right,
            key := arr at(i)
            j := i - 1
            while(j >= left and(arr at(j) > key),
                arr atPut(j + 1, arr at(j))
                j = j - 1
            )
            arr atPut(j + 1, key)
            i = i + 1
        )
    )

    merge := method(arr, left, mid, right,
        lp := arr slice(left, mid + 1)
        rp := arr slice(mid + 1, right + 1)
        i := 0; j := 0; k := left
        while(i < lp size and(j < rp size),
            if(lp at(i) <= rp at(j),
                arr atPut(k, lp at(i)); i = i + 1
            ,
                arr atPut(k, rp at(j)); j = j + 1
            )
            k = k + 1
        )
        while(i < lp size, arr atPut(k, lp at(i)); i = i + 1; k = k + 1)
        while(j < rp size, arr atPut(k, rp at(j)); j = j + 1; k = k + 1)
    )

    sort := method(arr,
        n := arr size
        i := 0
        while(i < n,
            insertionSort(arr, i, (i + minRun - 1) min(n - 1))
            i = i + minRun
        )
        size := minRun
        while(size < n,
            left := 0
            while(left < n,
                mid := (left + size - 1) min(n - 1)
                right := (left + 2 * size - 1) min(n - 1)
                if(mid < right, merge(arr, left, mid, right))
                left = left + 2 * size
            )
            size = size * 2
        )
        arr
    )
)

arr := list(5, 2, 8, 1, 9, 3, 7, 4, 6)
TimSort sort(arr) println
