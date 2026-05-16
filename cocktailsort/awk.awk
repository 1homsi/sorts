function cocktailSort(arr, n,    swapped, start, end, tmp, i) {
    swapped = 1
    start = 1
    end = n
    while (swapped) {
        swapped = 0
        for (i = start; i < end; i++) {
            if (arr[i] > arr[i+1]) {
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = 1
            }
        }
        if (!swapped) break
        swapped = 0
        end--
        for (i = end - 1; i >= start; i--) {
            if (arr[i] > arr[i+1]) {
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = 1
            }
        }
        start++
    }
}

BEGIN {
    n = split("5 3 8 1 9 2 7 4 6 0", arr, " ")
    cocktailSort(arr, n)
    for (i = 1; i <= n; i++) printf "%d ", arr[i]
    print ""
}
