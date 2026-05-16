BEGIN {
    split("5 3 8 1 9 2 7 4 6 0", arr, " ")
    n = 10
    i = 1
    while (i <= n) {
        if (i == 1 || arr[i] >= arr[i-1]) {
            i++
        } else {
            tmp = arr[i]
            arr[i] = arr[i-1]
            arr[i-1] = tmp
            i--
        }
    }
    for (k = 1; k <= n; k++) printf arr[k] " "
    print ""
}
