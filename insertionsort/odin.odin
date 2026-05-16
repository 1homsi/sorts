package main

insertion_sort :: proc(arr: []int) {
    n := len(arr)
    for i := 1; i < n; i += 1 {
        key := arr[i]
        j := i - 1
        for j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            j -= 1
        }
        arr[j + 1] = key
    }
}
