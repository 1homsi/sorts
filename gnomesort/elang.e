def gnomeSort(arr) {
    var i := 0
    def n := arr.size()
    while (i < n) {
        if (i == 0 || arr[i] >= arr[i - 1]) {
            i += 1
        } else {
            def tmp := arr[i]
            arr[i] := arr[i - 1]
            arr[i - 1] := tmp
            i -= 1
        }
    }
    arr
}
