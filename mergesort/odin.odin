package main

import "core:fmt"

merge :: proc(left, right: []int) -> []int {
    result := make([dynamic]int)
    i, j := 0, 0
    for i < len(left) && j < len(right) {
        if left[i] <= right[j] {
            append(&result, left[i])
            i += 1
        } else {
            append(&result, right[j])
            j += 1
        }
    }
    for i < len(left) { append(&result, left[i]); i += 1 }
    for j < len(right) { append(&result, right[j]); j += 1 }
    return result[:]
}

merge_sort :: proc(arr: []int) -> []int {
    if len(arr) <= 1 do return arr
    mid := len(arr) / 2
    left := merge_sort(arr[:mid])
    right := merge_sort(arr[mid:])
    return merge(left, right)
}

main :: proc() {
    arr := []int{38, 27, 43, 3, 9, 82, 10}
    sorted := merge_sort(arr)
    fmt.println(sorted)
}
