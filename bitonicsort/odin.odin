package main

import "core:fmt"

compare_and_swap :: proc(arr: ^[dynamic]int, i, j: int, direction: bool) {
    if direction == (arr[i] > arr[j]) {
        arr[i], arr[j] = arr[j], arr[i]
    }
}

bitonic_merge :: proc(arr: ^[dynamic]int, lo, cnt: int, direction: bool) {
    if cnt > 1 {
        k := cnt / 2
        for i in lo..<lo+k {
            compare_and_swap(arr, i, i+k, direction)
        }
        bitonic_merge(arr, lo, k, direction)
        bitonic_merge(arr, lo+k, k, direction)
    }
}

bitonic_sort :: proc(arr: ^[dynamic]int, lo, cnt: int, direction: bool) {
    if cnt > 1 {
        k := cnt / 2
        bitonic_sort(arr, lo, k, true)
        bitonic_sort(arr, lo+k, k, false)
        bitonic_merge(arr, lo, cnt, direction)
    }
}

main :: proc() {
    data := [dynamic]int{3, 7, 4, 8, 6, 2, 1, 5}
    bitonic_sort(&data, 0, len(data), true)
    fmt.println(data)
}
