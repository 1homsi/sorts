package main

import "core:fmt"

flip :: proc(arr: []int, k: int) {
    left, right := 0, k
    for left < right {
        arr[left], arr[right] = arr[right], arr[left]
        left += 1
        right -= 1
    }
}

pancake_sort :: proc(arr: []int) {
    size := len(arr)
    for size > 1 {
        max_idx := 0
        for i in 1..<size {
            if arr[i] > arr[max_idx] do max_idx = i
        }
        if max_idx != size - 1 {
            if max_idx != 0 do flip(arr, max_idx)
            flip(arr, size - 1)
        }
        size -= 1
    }
}

main :: proc() {
    arr := []int{3, 6, 2, 7, 4, 1, 5}
    pancake_sort(arr)
    fmt.println(arr)
}
