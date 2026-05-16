package main

import "core:fmt"

counting_sort :: proc(arr: []int) -> []int {
    if len(arr) == 0 do return arr
    min, max := arr[0], arr[0]
    for v in arr {
        if v < min do min = v
        if v > max do max = v
    }
    range := max - min + 1
    count := make([]int, range)
    defer delete(count)
    for v in arr do count[v - min] += 1
    for i in 1..<range do count[i] += count[i - 1]
    output := make([]int, len(arr))
    for i := len(arr) - 1; i >= 0; i -= 1 {
        count[arr[i] - min] -= 1
        output[count[arr[i] - min]] = arr[i]
    }
    return output
}

main :: proc() {
    arr := []int{4, 2, 2, 8, 3, 3, 1}
    result := counting_sort(arr)
    defer delete(result)
    fmt.println(result)
}
