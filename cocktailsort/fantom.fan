class CocktailSort {
    static Int[] sort(Int[] arr) {
        swapped := true
        start := 0
        end := arr.size - 1
        while (swapped) {
            swapped = false
            for (i := start; i < end; ++i) {
                if (arr[i] > arr[i + 1]) {
                    tmp := arr[i]
                    arr[i] = arr[i + 1]
                    arr[i + 1] = tmp
                    swapped = true
                }
            }
            if (!swapped) break
            swapped = false
            --end
            for (i := end - 1; i >= start; --i) {
                if (arr[i] > arr[i + 1]) {
                    tmp := arr[i]
                    arr[i] = arr[i + 1]
                    arr[i + 1] = tmp
                    swapped = true
                }
            }
            ++start
        }
        return arr
    }
}
