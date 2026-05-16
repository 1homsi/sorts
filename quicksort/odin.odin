package main

import "core:fmt"

partition :: proc(arr: []int, low, high: int) -> int {
    pivot := arr[high]
    i := low
    for j in low..<high {
        if arr[j] <= pivot {
            arr[i], arr[j] = arr[j], arr[i]
            i += 1
        }
    }
    arr[i], arr[high] = arr[high], arr[i]
    return i
}

quicksort :: proc(arr: []int, low, high: int) {
    if low < high {
        p := partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)
    }
}

main :: proc() {
    arr := []int{3, 6, 8, 10, 1, 2, 1}
    quicksort(arr, 0, len(arr) - 1)
    fmt.println(arr)
}
