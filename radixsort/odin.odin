package main

import "core:fmt"

counting_sort :: proc(arr: []int, exp: int) {
    n := len(arr)
    output := make([]int, n)
    defer delete(output)
    count := [10]int{}
    for x in arr { count[(x / exp) % 10] += 1 }
    for i in 1..<10 { count[i] += count[i-1] }
    for i := n - 1; i >= 0; i -= 1 {
        idx := (arr[i] / exp) % 10
        count[idx] -= 1
        output[count[idx]] = arr[i]
    }
    copy(arr, output)
}

radix_sort :: proc(arr: []int) {
    if len(arr) == 0 { return }
    max := arr[0]
    for x in arr { if x > max { max = x } }
    for exp := 1; max / exp > 0; exp *= 10 {
        counting_sort(arr, exp)
    }
}

main :: proc() {
    arr := []int{170, 45, 75, 90, 802, 24, 2, 66}
    radix_sort(arr)
    fmt.println(arr)
}
