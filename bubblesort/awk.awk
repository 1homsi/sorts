BEGIN {
    split("64 34 25 12 22 11 90", arr, " ")
    n = 7
    do {
        swapped = 0
        for (i = 1; i < n; i++) {
            if (arr[i] > arr[i+1]) {
                tmp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = tmp
                swapped = 1
            }
        }
        n--
    } while (swapped)
    for (i = 1; i <= 7; i++) printf "%s ", arr[i]
    print ""
}
