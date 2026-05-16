def cycleSort(arr) {
    def writes = 0
    def n = arr.size()
    for (def cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        def item = arr[cycleStart]
        def pos = cycleStart
        for (def i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++
        }
        if (pos == cycleStart) continue
        while (item == arr[pos]) pos++
        def tmp = arr[pos]; arr[pos] = item; item = tmp
        writes++
        while (pos != cycleStart) {
            pos = cycleStart
            for (def i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++
            }
            while (item == arr[pos]) pos++
            tmp = arr[pos]; arr[pos] = item; item = tmp
            writes++
        }
    }
    writes
}

def arr = [5, 4, 3, 2, 1]
cycleSort(arr)
println arr
