def selectionSort(arr) {
    def n := arr.size()
    var i := 0
    while (i < n) {
        var minIdx := i
        var j := i + 1
        while (j < n) {
            if (arr[j] < arr[minIdx]) { minIdx := j }
            j += 1
        }
        def tmp := arr[i]
        arr[i] := arr[minIdx]
        arr[minIdx] := tmp
        i += 1
    }
    arr
}
