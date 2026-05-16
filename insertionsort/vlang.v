fn insertion_sort(mut arr []int) []int {
    for i := 1; i < arr.len; i++ {
        key := arr[i]
        mut j := i - 1
        for j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            j--
        }
        arr[j + 1] = key
    }
    return arr
}
