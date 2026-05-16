fn selection_sort(mut arr []int) []int {
    n := arr.len
    for i in 0..n {
        mut min_idx := i
        for j in i+1..n {
            if arr[j] < arr[min_idx] { min_idx = j }
        }
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
    }
    return arr
}
