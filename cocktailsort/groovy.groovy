def cocktailSort(arr) {
    def swapped = true
    def start = 0
    def end = arr.size() - 1
    while (swapped) {
        swapped = false
        for (def i = start; i < end; i++) {
            if (arr[i] > arr[i + 1]) {
                def tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            }
        }
        if (!swapped) break
        swapped = false
        end--
        for (def i = end - 1; i >= start; i--) {
            if (arr[i] > arr[i + 1]) {
                def tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            }
        }
        start++
    }
    arr
}
