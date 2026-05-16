function merge(arr, l, m, r,    i, j, k, L, R, nL, nR) {
    nL = m - l + 1
    nR = r - m
    for (i = 1; i <= nL; i++) L[i] = arr[l + i - 1]
    for (j = 1; j <= nR; j++) R[j] = arr[m + j]
    i = 1; j = 1; k = l
    while (i <= nL && j <= nR) {
        if (L[i] <= R[j]) arr[k++] = L[i++]
        else              arr[k++] = R[j++]
    }
    while (i <= nL) arr[k++] = L[i++]
    while (j <= nR) arr[k++] = R[j++]
}

function mergesort(arr, l, r,    m) {
    if (l < r) {
        m = int((l + r) / 2)
        mergesort(arr, l, m)
        mergesort(arr, m + 1, r)
        merge(arr, l, m, r)
    }
}

BEGIN {
    split("5 2 8 1 9 3", a, " ")
    mergesort(a, 1, 6)
    for (i = 1; i <= 6; i++) printf "%s ", a[i]
    print ""
}
