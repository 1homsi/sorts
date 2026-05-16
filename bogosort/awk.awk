BEGIN {
    srand()
    n = 8
    arr[1] = 3; arr[2] = 1; arr[3] = 4; arr[4] = 1
    arr[5] = 5; arr[6] = 9; arr[7] = 2; arr[8] = 6

    do {
        sorted = 1
        for (i = 1; i < n; i++) {
            if (arr[i] > arr[i+1]) { sorted = 0; break }
        }
        if (!sorted) {
            for (i = n; i > 1; i--) {
                j = int(rand() * i) + 1
                tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp
            }
        }
    } while (!sorted)

    for (i = 1; i <= n; i++) printf "%d ", arr[i]
    print ""
}
