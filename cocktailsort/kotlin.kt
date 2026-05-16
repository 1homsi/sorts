fun cocktailSort(arr: IntArray) {
    var swapped = true
    var start = 0
    var end = arr.size - 1
    while (swapped) {
        swapped = false
        for (i in start until end) {
            if (arr[i] > arr[i + 1]) {
                val temp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = temp
                swapped = true
            }
        }
        if (!swapped) break
        swapped = false
        end--
        for (i in end - 1 downTo start) {
            if (arr[i] > arr[i + 1]) {
                val temp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = temp
                swapped = true
            }
        }
        start++
    }
}
