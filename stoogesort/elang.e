def stoogeSort(var arr, first, last) {
    if (arr[first] > arr[last]) {
        def tmp := arr[first]
        arr := arr.with(first, arr[last]).with(last, tmp)
    }
    def n := last - first + 1
    if (n > 2) {
        def t := n * 2 // 3
        arr := stoogeSort(arr, first, first + t - 1)
        arr := stoogeSort(arr, last - t + 1, last)
        arr := stoogeSort(arr, first, first + t - 1)
    }
    arr
}

def arr := [3, 1, 4, 1, 5, 9, 2, 6]
println(stoogeSort(arr, 0, arr.size() - 1))
