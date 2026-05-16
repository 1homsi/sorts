package main

import "fmt"

func stoogeSort(arr []int, first, last int) {
    if arr[first] > arr[last] {
        arr[first], arr[last] = arr[last], arr[first]
    }
    if last-first+1 > 2 {
        t := (last - first + 1) * 2 / 3
        stoogeSort(arr, first, first+t-1)
        stoogeSort(arr, last-t+1, last)
        stoogeSort(arr, first, first+t-1)
    }
}

func main() {
    arr := []int{3, 1, 4, 1, 5, 9, 2, 6}
    stoogeSort(arr, 0, len(arr)-1)
    fmt.Println(arr)
}
