package main

import "core:fmt"

cycle_sort :: proc(arr: []int) -> int {
    writes := 0
    n := len(arr)
    for cycle_start in 0..<n-1 {
        item := arr[cycle_start]
        pos := cycle_start
        for i in cycle_start+1..<n {
            if arr[i] < item do pos += 1
        }
        if pos == cycle_start do continue
        for item == arr[pos] do pos += 1
        arr[pos], item = item, arr[pos]
        writes += 1
        for pos != cycle_start {
            pos = cycle_start
            for i in cycle_start+1..<n {
                if arr[i] < item do pos += 1
            }
            for item == arr[pos] do pos += 1
            arr[pos], item = item, arr[pos]
            writes += 1
        }
    }
    return writes
}

main :: proc() {
    arr := []int{5, 4, 3, 2, 1}
    cycle_sort(arr)
    fmt.println(arr)
}
