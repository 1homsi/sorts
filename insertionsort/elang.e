def insertionSort(arr) {
    def n := arr.size()
    var i := 1
    while (i < n) {
        def key := arr[i]
        var j := i - 1
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] := arr[j]
            j -= 1
        }
        arr[j + 1] := key
        i += 1
    }
    arr
}
