package gnomesort

gnome_sort :: proc(arr: []int) {
    i := 0
    for i < len(arr) {
        if i == 0 || arr[i] >= arr[i - 1] {
            i += 1
        } else {
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            i -= 1
        }
    }
}
