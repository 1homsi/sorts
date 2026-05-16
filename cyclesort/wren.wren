class CycleSort {
    static sort(arr) {
        var writes = 0
        var n = arr.count
        for (cycleStart in 0...n-1) {
            var item = arr[cycleStart]
            var pos = cycleStart
            for (i in cycleStart+1...n) {
                if (arr[i] < item) pos = pos + 1
            }
            if (pos == cycleStart) continue
            while (item == arr[pos]) pos = pos + 1
            var tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes = writes + 1
            while (pos != cycleStart) {
                pos = cycleStart
                for (i in cycleStart+1...n) {
                    if (arr[i] < item) pos = pos + 1
                }
                while (item == arr[pos]) pos = pos + 1
                tmp = arr[pos]
                arr[pos] = item
                item = tmp
                writes = writes + 1
            }
        }
        return writes
    }
}

var arr = [5, 4, 3, 2, 1]
CycleSort.sort(arr)
System.print(arr)
