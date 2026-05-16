BEGIN {
    n = 8
    arr[0]=3; arr[1]=7; arr[2]=4; arr[3]=8
    arr[4]=6; arr[5]=2; arr[6]=1; arr[7]=5

    bitonic_sort(0, n, 1)

    for (i = 0; i < n; i++) printf "%d ", arr[i]
    print ""
}

function compare_and_swap(i, j, dir,    tmp) {
    if (dir == (arr[i] > arr[j])) {
        tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp
    }
}

function bitonic_merge(lo, cnt, dir,    k, i) {
    if (cnt > 1) {
        k = int(cnt / 2)
        for (i = lo; i < lo + k; i++) compare_and_swap(i, i + k, dir)
        bitonic_merge(lo, k, dir)
        bitonic_merge(lo + k, k, dir)
    }
}

function bitonic_sort(lo, cnt, dir,    k) {
    if (cnt > 1) {
        k = int(cnt / 2)
        bitonic_sort(lo, k, 1)
        bitonic_sort(lo + k, k, 0)
        bitonic_merge(lo, cnt, dir)
    }
}
