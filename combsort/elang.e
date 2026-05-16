def combSort(arr) {
    def n := arr.size()
    var gap := n
    var sorted := false
    while (!sorted) {
        gap := (gap / 1.3).floor()
        if (gap <= 1) {
            gap := 1
            sorted := true
        }
        var i := 0
        while (i + gap < n) {
            if (arr[i] > arr[i + gap]) {
                def tmp := arr[i]
                arr[i] := arr[i + gap]
                arr[i + gap] := tmp
                sorted := false
            }
            i += 1
        }
    }
    arr
}
