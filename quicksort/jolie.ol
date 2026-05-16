define quicksort {
    arr -> arr
    low -> low
    high -> high
    if (low < high) {
        pivot = arr.(high)
        i = low
        for (j = low, j < high, j++) {
            if (arr.(j) <= pivot) {
                tmp = arr.(i)
                arr.(i) = arr.(j)
                arr.(j) = tmp
                i++
            }
        }
        tmp = arr.(i)
        arr.(i) = arr.(high)
        arr.(high) = tmp
        p = i
        quicksort@(arr = arr, low = low, high = p - 1)
        quicksort@(arr = arr, low = p + 1, high = high)
    }
}

main {
    arr[0] = 3; arr[1] = 6; arr[2] = 8; arr[3] = 10
    arr[4] = 1; arr[5] = 2; arr[6] = 1
    quicksort@(arr = arr, low = 0, high = 6)
    println@Console(arr)()
}
