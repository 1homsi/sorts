function comb_sort(arr, n,    gap, sorted, i, tmp) {
    gap = n
    sorted = 0
    while (!sorted) {
        gap = int(gap / 1.3)
        if (gap < 1) gap = 1
        sorted = (gap == 1) ? 1 : 0
        for (i = 1; i <= n - gap; i++) {
            if (arr[i] > arr[i + gap]) {
                tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = 0
            }
        }
    }
}
