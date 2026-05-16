BitonicSort = Origin mimic do(
    compareAndSwap = method(arr, i, j, dir,
        ai = arr[i]
        aj = arr[j]
        if(dir == (ai > aj),
            arr[i] = aj
            arr[j] = ai
        )
    )

    bitonicMerge = method(arr, lo, cnt, dir,
        if(cnt > 1,
            k = cnt / 2
            lo upto(lo + k - 1) each(i,
                compareAndSwap(arr, i, i + k, dir)
            )
            bitonicMerge(arr, lo, k, dir)
            bitonicMerge(arr, lo + k, k, dir)
        )
    )

    bitonicSort = method(arr, lo, cnt, dir,
        if(cnt > 1,
            k = cnt / 2
            bitonicSort(arr, lo, k, true)
            bitonicSort(arr, lo + k, k, false)
            bitonicMerge(arr, lo, cnt, dir)
        )
    )
)

data = [3, 7, 4, 8, 6, 2, 1, 5]
BitonicSort bitonicSort(data, 0, data length, true)
data println
