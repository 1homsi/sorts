package main

import "core:fmt"

heapify :: proc(arr: []int, n, i: int) {
    largest := i
    left := 2*i + 1
    right := 2*i + 2
    if left < n && arr[left] > arr[largest] do largest = left
    if right < n && arr[right] > arr[largest] do largest = right
    if largest != i {
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify(arr, n, largest)
    }
}

heapsort :: proc(arr: []int) {
    n := len(arr)
    for i := n/2 - 1; i >= 0; i -= 1 do heapify(arr, n, i)
    for i := n - 1; i > 0; i -= 1 {
        arr[0], arr[i] = arr[i], arr[0]
        heapify(arr, i, 0)
    }
}

main :: proc() {
    arr := []int{12, 11, 13, 5, 6, 7}
    heapsort(arr)
    fmt.println(arr)
}
