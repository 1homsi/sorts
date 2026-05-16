function gnomesort(arr) {
    i := 1
    while i < len(arr) {
        if arr[i] >= arr[i-1] {
            i += 1
        } else {
            swap(arr, i, i-1)
            i = max(1, i-1)
        }
    }
    return arr
}
