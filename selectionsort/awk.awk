function selection_sort(arr, n,    i, j, min_idx, tmp) {
    for (i = 1; i <= n; i++) {
        min_idx = i
        for (j = i + 1; j <= n; j++) {
            if (arr[j] < arr[min_idx]) min_idx = j
        }
        tmp = arr[i]; arr[i] = arr[min_idx]; arr[min_idx] = tmp
    }
}
BEGIN {
    split("5 3 1 4 2", arr, " ")
    n = 5
    selection_sort(arr, n)
    for (i = 1; i <= n; i++) printf arr[i] " "
    print ""
}
