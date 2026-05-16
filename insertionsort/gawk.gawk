function insertion_sort(arr, n,    i, j, key) {
    for (i = 2; i <= n; i++) {
        key = arr[i]
        j = i - 1
        while (j >= 1 && arr[j] > key) {
            arr[j+1] = arr[j]
            j--
        }
        arr[j+1] = key
    }
}

BEGIN {
    split("5 3 1 4 2", a)
    n = 5
    insertion_sort(a, n)
    for (i = 1; i <= n; i++) printf a[i] " "
    print ""
}
