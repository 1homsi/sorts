selection_sort(arr : []int) : []int :=
    n := len(arr)
    for i := 0; i < n; i++ {
        min_idx := i
        for j := i + 1; j < n; j++ {
            if arr[j] < arr[min_idx] {
                min_idx = j
            }
        }
        tmp := arr[i]
        arr[i] = arr[min_idx]
        arr[min_idx] = tmp
    }
    arr
