BEGIN {
    split("3 6 2 7 4 1 5", arr, " ")
    n = 7

    for (size = n; size > 1; size--) {
        maxIdx = 1
        for (i = 2; i <= size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i
        }
        if (maxIdx != size) {
            if (maxIdx != 1) flip(maxIdx)
            flip(size)
        }
    }

    for (i = 1; i <= n; i++) printf arr[i] " "
    print ""
}

function flip(k,    left, right, tmp) {
    left = 1; right = k
    while (left < right) {
        tmp = arr[left]; arr[left] = arr[right]; arr[right] = tmp
        left++; right--
    }
}
