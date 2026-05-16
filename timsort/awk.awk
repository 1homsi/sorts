BEGIN {
    MIN_RUN = 32
    n = 9
    arr[0]=5; arr[1]=2; arr[2]=8; arr[3]=1; arr[4]=9
    arr[5]=3; arr[6]=7; arr[7]=4; arr[8]=6

    i = 0
    while (i < n) {
        right = i + MIN_RUN - 1
        if (right >= n) right = n - 1
        insertion_sort(i, right)
        i += MIN_RUN
    }

    size = MIN_RUN
    while (size < n) {
        left = 0
        while (left < n) {
            mid = left + size - 1
            if (mid >= n) mid = n - 1
            right = left + 2 * size - 1
            if (right >= n) right = n - 1
            if (mid < right) merge(left, mid, right)
            left += 2 * size
        }
        size *= 2
    }

    for (i = 0; i < n; i++) printf "%d ", arr[i]
    print ""
}

function insertion_sort(left, right,    i, j, key) {
    for (i = left + 1; i <= right; i++) {
        key = arr[i]
        j = i - 1
        while (j >= left && arr[j] > key) {
            arr[j+1] = arr[j]
            j--
        }
        arr[j+1] = key
    }
}

function merge(left, mid, right,    i, j, k, ln, rn) {
    ln = mid - left + 1
    rn = right - mid
    for (i = 0; i < ln; i++) lp[i] = arr[left+i]
    for (i = 0; i < rn; i++) rp[i] = arr[mid+1+i]
    i = 0; j = 0; k = left
    while (i < ln && j < rn) {
        if (lp[i] <= rp[j]) { arr[k++] = lp[i++] }
        else { arr[k++] = rp[j++] }
    }
    while (i < ln) { arr[k++] = lp[i++] }
    while (j < rn) { arr[k++] = rp[j++] }
}
