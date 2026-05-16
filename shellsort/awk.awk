BEGIN {
    split("64 34 25 12 22 11 90", arr, " ")
    n = 7
    gap = int(n / 2)
    while (gap > 0) {
        for (i = gap + 1; i <= n; i++) {
            temp = arr[i]
            j = i
            while (j > gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap = int(gap / 2)
    }
    for (i = 1; i <= n; i++) printf "%s ", arr[i]
    print ""
}
