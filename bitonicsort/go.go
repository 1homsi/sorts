package main

import "fmt"

func compareAndSwap(arr []int, i, j int, direction bool) {
	if direction == (arr[i] > arr[j]) {
		arr[i], arr[j] = arr[j], arr[i]
	}
}

func bitonicMerge(arr []int, lo, cnt int, direction bool) {
	if cnt > 1 {
		k := cnt / 2
		for i := lo; i < lo+k; i++ {
			compareAndSwap(arr, i, i+k, direction)
		}
		bitonicMerge(arr, lo, k, direction)
		bitonicMerge(arr, lo+k, k, direction)
	}
}

func bitonicSort(arr []int, lo, cnt int, direction bool) {
	if cnt > 1 {
		k := cnt / 2
		bitonicSort(arr, lo, k, true)
		bitonicSort(arr, lo+k, k, false)
		bitonicMerge(arr, lo, cnt, direction)
	}
}

func main() {
	data := []int{3, 7, 4, 8, 6, 2, 1, 5}
	bitonicSort(data, 0, len(data), true)
	fmt.Println(data)
}
