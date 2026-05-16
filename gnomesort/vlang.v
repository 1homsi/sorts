fn gnome_sort(mut arr []int) []int {
    mut i := 0
    for i < arr.len {
        if i == 0 || arr[i] >= arr[i - 1] {
            i++
        } else {
            arr[i], arr[i - 1] = arr[i - 1], arr[i]
            i--
        }
    }
    return arr
}
