arr = [3, 7, 4, 8, 6, 2, 1, 5]

func compareAndSwap ai, j, dir
    ai2 = arr[ai]
    aj = arr[j]
    if dir = (ai2 > aj)
        arr[ai] = aj
        arr[j] = ai2
    ok

func bitonicMerge lo, cnt, dir
    if cnt > 1
        k = cnt / 2
        for i = lo to lo + k - 1
            compareAndSwap(i, i + k, dir)
        next
        bitonicMerge(lo, k, dir)
        bitonicMerge(lo + k, k, dir)
    ok

func bitonicSort lo, cnt, dir
    if cnt > 1
        k = cnt / 2
        bitonicSort(lo, k, true)
        bitonicSort(lo + k, k, false)
        bitonicMerge(lo, cnt, dir)
    ok

bitonicSort(1, len(arr), true)
see arr
