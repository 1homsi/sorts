BEGIN {
    split("4 2 2 8 3 3 1", arr, " ")
    n = 7
    min = arr[1]; max = arr[1]
    for (i = 2; i <= n; i++) {
        if (arr[i] < min) min = arr[i]
        if (arr[i] > max) max = arr[i]
    }
    range = max - min + 1
    for (i = 0; i < range; i++) count[i] = 0
    for (i = 1; i <= n; i++) count[arr[i] - min]++
    for (i = 1; i < range; i++) count[i] += count[i - 1]
    for (i = n; i >= 1; i--) {
        idx = arr[i] - min
        count[idx]--
        output[count[idx]] = arr[i]
    }
    for (i = 0; i < n; i++) printf "%d ", output[i]
    print ""
}
