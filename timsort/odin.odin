package main

import "core:fmt"

MIN_RUN :: 32

insertion_sort :: proc(arr: []int, left, right: int) {
    for i in left+1..=right {
        key := arr[i]
        j := i - 1
        for j >= left && arr[j] > key {
            arr[j+1] = arr[j]
            j -= 1
        }
        arr[j+1] = key
    }
}

merge :: proc(arr: []int, left, mid, right: int) {
    lp := make([]int, mid-left+1)
    rp := make([]int, right-mid)
    defer delete(lp)
    defer delete(rp)
    copy(lp, arr[left:mid+1])
    copy(rp, arr[mid+1:right+1])
    i, j, k := 0, 0, left
    for i < len(lp) && j < len(rp) {
        if lp[i] <= rp[j] { arr[k] = lp[i]; i += 1 }
        else { arr[k] = rp[j]; j += 1 }
        k += 1
    }
    for i < len(lp) { arr[k] = lp[i]; i += 1; k += 1 }
    for j < len(rp) { arr[k] = rp[j]; j += 1; k += 1 }
}

timsort :: proc(arr: []int) {
    n := len(arr)
    i := 0
    for i < n {
        right := min(i + MIN_RUN - 1, n - 1)
        insertion_sort(arr, i, right)
        i += MIN_RUN
    }
    size := MIN_RUN
    for size < n {
        left := 0
        for left < n {
            mid := min(left + size - 1, n - 1)
            right := min(left + 2*size - 1, n - 1)
            if mid < right { merge(arr, left, mid, right) }
            left += 2 * size
        }
        size *= 2
    }
}

main :: proc() {
    arr := []int{5, 2, 8, 1, 9, 3, 7, 4, 6}
    timsort(arr)
    fmt.println(arr)
}
