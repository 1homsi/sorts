package main

import "core:fmt"

shell_sort :: proc(arr: []int) {
    n := len(arr)
    gap := n / 2
    for gap > 0 {
        for i := gap; i < n; i += 1 {
            temp := arr[i]
            j := i
            for j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap]
                j -= gap
            }
            arr[j] = temp
        }
        gap /= 2
    }
}

main :: proc() {
    arr := []int{64, 34, 25, 12, 22, 11, 90}
    shell_sort(arr)
    fmt.println(arr)
}
