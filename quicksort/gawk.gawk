function partition(arr, low, high,    pivot, i, j, tmp) {
    pivot = arr[high]
    i = low
    for (j = low; j < high; j++) {
        if (arr[j] <= pivot) {
            tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp
            i++
        }
    }
    tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp
    return i
}

function quicksort(arr, low, high,    p) {
    if (low < high) {
        p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)
    }
}

BEGIN {
    n = split("3 6 8 10 1 2 1", arr, " ")
    quicksort(arr, 1, n)
    for (i = 1; i <= n; i++) printf "%s ", arr[i]
    print ""
}
