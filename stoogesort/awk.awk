function stooge_sort(arr, first, last,    tmp, t, n) {
    if (arr[first] > arr[last]) {
        tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    }
    n = last - first + 1
    if (n > 2) {
        t = int(n * 2 / 3)
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)
    }
}

BEGIN {
    n = split("3 1 4 1 5 9 2 6", arr, " ")
    stooge_sort(arr, 1, n)
    for (i = 1; i <= n; i++) printf "%s ", arr[i]
    print ""
}
