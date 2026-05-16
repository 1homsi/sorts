package main

import "core:fmt"

bubble_sort :: proc(arr: []int) {
    n := len(arr)
    swapped := true
    for swapped {
        swapped = false
        for i in 0..<n-1 {
            if arr[i] > arr[i+1] {
                arr[i], arr[i+1] = arr[i+1], arr[i]
                swapped = true
            }
        }
        n -= 1
    }
}

main :: proc() {
    arr := []int{64, 34, 25, 12, 22, 11, 90}
    bubble_sort(arr)
    fmt.println(arr)
}
