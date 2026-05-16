BitonicSort := Object clone do(
    compareAndSwap := method(arr, i, j, direction,
        ai := arr at(i)
        aj := arr at(j)
        if(direction == (ai > aj),
            arr atPut(i, aj)
            arr atPut(j, ai)
        )
    )

    bitonicMerge := method(arr, lo, cnt, direction,
        if(cnt > 1,
            k := cnt / 2 floor
            lo to(lo + k - 1) do(i,
                compareAndSwap(arr, i, i + k, direction)
            )
            bitonicMerge(arr, lo, k, direction)
            bitonicMerge(arr, lo + k, k, direction)
        )
    )

    bitonicSort := method(arr, lo, cnt, direction,
        if(cnt > 1,
            k := cnt / 2 floor
            bitonicSort(arr, lo, k, true)
            bitonicSort(arr, lo + k, k, false)
            bitonicMerge(arr, lo, cnt, direction)
        )
    )
)

data := list(3, 7, 4, 8, 6, 2, 1, 5)
BitonicSort bitonicSort(data, 0, data size, true)
data println
