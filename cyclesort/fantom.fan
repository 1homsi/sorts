class CycleSort {
    static Int cycleSort(Int[] arr) {
        writes := 0
        n := arr.size
        for (cycleStart := 0; cycleStart < n - 1; ++cycleStart) {
            item := arr[cycleStart]
            pos := cycleStart
            for (i := cycleStart + 1; i < n; ++i) {
                if (arr[i] < item) pos++
            }
            if (pos == cycleStart) continue
            while (item == arr[pos]) pos++
            tmp := arr[pos]; arr[pos] = item; item = tmp
            writes++
            while (pos != cycleStart) {
                pos = cycleStart
                for (i := cycleStart + 1; i < n; ++i) {
                    if (arr[i] < item) pos++
                }
                while (item == arr[pos]) pos++
                tmp = arr[pos]; arr[pos] = item; item = tmp
                writes++
            }
        }
        return writes
    }

    static Void main() {
        arr := [5, 4, 3, 2, 1]
        cycleSort(arr)
        echo(arr)
    }
}
