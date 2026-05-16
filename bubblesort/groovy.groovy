def bubbleSort(arr) {
    def n = arr.size()
    def swapped
    do {
        swapped = false
        (0..<n-1).each { i ->
            if (arr[i] > arr[i+1]) {
                def tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = true
            }
        }
        n--
    } while (swapped)
    arr
}

def arr = [64, 34, 25, 12, 22, 11, 90]
println bubbleSort(arr)
