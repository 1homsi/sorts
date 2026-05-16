bitonicsort: func(arr: Array<Int>, lo: Int, cnt: Int, dir: Int) {
    if (cnt > 1) {
        k := cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    }
}

bitonicmerge: func(arr: Array<Int>, lo: Int, cnt: Int, dir: Int) {
    if (cnt > 1) {
        k := cnt / 2
        for (i in lo..lo + cnt - k) {
            if ((arr get(i) > arr get(i + k)) == (dir == 1)) {
                tmp := arr get(i)
                arr set(i, arr get(i + k))
                arr set(i + k, tmp)
            }
        }
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    }
}

arr := [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, 8, 1)
arr println()
