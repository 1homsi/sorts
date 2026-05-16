GnomeSort(arr, n) {
    i := 1
    while (i <= n) {
        if (i = 1 or arr[i] >= arr[i - 1]) {
            i++
        } else {
            tmp := arr[i]
            arr[i] := arr[i - 1]
            arr[i - 1] := tmp
            i--
        }
    }
    return arr
}
