package main

import "core:fmt"
import "core:math/rand"

is_sorted :: proc(arr: []int) -> bool {
    for i in 0 ..< len(arr) - 1 {
        if arr[i] > arr[i + 1] do return false
    }
    return true
}

shuffle :: proc(arr: []int) {
    n := len(arr)
    for i := n - 1; i > 0; i -= 1 {
        j := rand.int_max(i + 1)
        arr[i], arr[j] = arr[j], arr[i]
    }
}

bogosort :: proc(arr: []int) {
    for !is_sorted(arr) {
        shuffle(arr)
    }
}

main :: proc() {
    arr := []int{3, 1, 4, 1, 5, 9, 2, 6}
    bogosort(arr)
    fmt.println(arr)
}
