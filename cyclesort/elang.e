def cycleSort(arr) {
    def n := arr.size()
    var writes := 0
    var cycleStart := 0
    while (cycleStart < n - 1) {
        var item := arr[cycleStart]
        var pos := cycleStart
        var i := cycleStart + 1
        while (i < n) {
            if (arr[i] < item) { pos += 1 }
            i += 1
        }
        if (pos != cycleStart) {
            while (item == arr[pos]) { pos += 1 }
            def tmp := arr[pos]
            arr[pos] := item
            item := tmp
            writes += 1
            while (pos != cycleStart) {
                pos := cycleStart
                i := cycleStart + 1
                while (i < n) {
                    if (arr[i] < item) { pos += 1 }
                    i += 1
                }
                while (item == arr[pos]) { pos += 1 }
                def t := arr[pos]
                arr[pos] := item
                item := t
                writes += 1
            }
        }
        cycleStart += 1
    }
    arr
}

def arr := [5, 4, 3, 2, 1].diverge()
cycleSort(arr)
println(arr)
