BEGIN {
    while ((getline < "/dev/stdin") > 0) {
        arr[++n] = $0
    }
    for (i = 1; i <= n; i++) {
        for (j = 1; j <= n - i; j++) {
            if (arr[j] > arr[j + 1]) {
                temp = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            }
        }
    }
    for (i = 1; i <= n; i++) {
        print arr[i]
    }
}