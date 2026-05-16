package main

import "core:fmt"

stooge_sort :: proc(arr: []int, first, last: int) {
    if arr[first] > arr[last] {
        arr[first], arr[last] = arr[last], arr[first]
    }
    if last - first + 1 > 2 {
        t := (last - first + 1) * 2 / 3
        stooge_sort(arr, first, first + t - 1)
        stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)
    }
}

main :: proc() {
    arr := []int{3, 1, 4, 1, 5, 9, 2, 6}
    stooge_sort(arr, 0, len(arr) - 1)
    fmt.println(arr)
}
