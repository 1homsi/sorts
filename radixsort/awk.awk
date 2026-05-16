BEGIN {
    split("170 45 75 90 802 24 2 66", arr, " ")
    n = 8
    max_val = arr[1]
    for (i = 2; i <= n; i++) if (arr[i] > max_val) max_val = arr[i]
    exp = 1
    while (int(max_val / exp) > 0) {
        for (i = 0; i <= 9; i++) cnt[i] = 0
        for (i = 1; i <= n; i++) {
            idx = int(arr[i] / exp) % 10
            cnt[idx]++
        }
        for (i = 1; i <= 9; i++) cnt[i] += cnt[i-1]
        for (i = n; i >= 1; i--) {
            idx = int(arr[i] / exp) % 10
            out[cnt[idx]] = arr[i]
            cnt[idx]--
        }
        for (i = 1; i <= n; i++) arr[i] = out[i]
        exp *= 10
    }
    for (i = 1; i <= n; i++) printf "%s ", arr[i]
    print ""
}
