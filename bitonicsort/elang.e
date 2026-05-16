def compareAndSwap(var arr, i, j, direction) {
    def ai := arr[i]
    def aj := arr[j]
    if (direction == (ai > aj)) {
        arr := arr.with(i, aj).with(j, ai)
    }
    arr
}

def bitonicMerge(var arr, lo, cnt, direction) {
    if (cnt > 1) {
        def k := cnt // 2
        var i := lo
        while (i < lo + k) {
            arr := compareAndSwap(arr, i, i + k, direction)
            i += 1
        }
        arr := bitonicMerge(arr, lo, k, direction)
        arr := bitonicMerge(arr, lo + k, k, direction)
    }
    arr
}

def bitonicSort(var arr, lo, cnt, direction) {
    if (cnt > 1) {
        def k := cnt // 2
        arr := bitonicSort(arr, lo, k, true)
        arr := bitonicSort(arr, lo + k, k, false)
        arr := bitonicMerge(arr, lo, cnt, direction)
    }
    arr
}

def data := [3, 7, 4, 8, 6, 2, 1, 5]
println(bitonicSort(data, 0, data.size(), true))
