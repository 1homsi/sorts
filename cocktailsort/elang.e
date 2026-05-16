def cocktailSort(var arr) {
    var swapped := true
    var start := 0
    var end := arr.size() - 1
    while (swapped) {
        swapped := false
        var i := start
        while (i < end) {
            if (arr[i] > arr[i + 1]) {
                def tmp := arr[i]
                arr := arr.with(i, arr[i + 1]).with(i + 1, tmp)
                swapped := true
            }
            i += 1
        }
        if (!swapped) { break }
        swapped := false
        end -= 1
        i := end - 1
        while (i >= start) {
            if (arr[i] > arr[i + 1]) {
                def tmp := arr[i]
                arr := arr.with(i, arr[i + 1]).with(i + 1, tmp)
                swapped := true
            }
            i -= 1
        }
        start += 1
    }
    arr
}
