MIN_RUN := 32

InsertionSort(arr, left, right) {
    i := left + 1
    while (i <= right) {
        key := arr[i]
        j := i - 1
        while (j >= left && arr[j] > key) {
            arr[j + 1] := arr[j]
            j--
        }
        arr[j + 1] := key
        i++
    }
}

Merge(arr, left, mid, right) {
    lp := []
    rp := []
    i := left
    while (i <= mid) {
        lp.Push(arr[i])
        i++
    }
    i := mid + 1
    while (i <= right) {
        rp.Push(arr[i])
        i++
    }
    i := 1
    j := 1
    k := left
    while (i <= lp.Length && j <= rp.Length) {
        if (lp[i] <= rp[j]) {
            arr[k] := lp[i]
            i++
        } else {
            arr[k] := rp[j]
            j++
        }
        k++
    }
    while (i <= lp.Length) {
        arr[k] := lp[i]
        i++
        k++
    }
    while (j <= rp.Length) {
        arr[k] := rp[j]
        j++
        k++
    }
}

Timsort(arr) {
    n := arr.Length
    i := 1
    while (i <= n) {
        right := Min(i + MIN_RUN - 1, n)
        InsertionSort(arr, i, right)
        i += MIN_RUN
    }
    size := MIN_RUN
    while (size < n) {
        left := 1
        while (left <= n) {
            mid := Min(left + size - 1, n)
            right := Min(left + 2 * size - 1, n)
            if (mid < right)
                Merge(arr, left, mid, right)
            left += 2 * size
        }
        size *= 2
    }
}

arr := [5, 2, 8, 1, 9, 3, 7, 4, 6]
Timsort(arr)
out := ""
for v in arr
    out .= v " "
MsgBox(Trim(out))
