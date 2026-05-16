package main

import "fmt"

func flip(arr []int, k int) {
	left, right := 0, k
	for left < right {
		arr[left], arr[right] = arr[right], arr[left]
		left++
		right--
	}
}

func pancakeSort(arr []int) []int {
	for size := len(arr); size > 1; size-- {
		maxIdx := 0
		for i := 1; i < size; i++ {
			if arr[i] > arr[maxIdx] {
				maxIdx = i
			}
		}
		if maxIdx != size-1 {
			if maxIdx != 0 {
				flip(arr, maxIdx)
			}
			flip(arr, size-1)
		}
	}
	return arr
}

func main() {
	arr := []int{3, 6, 2, 7, 4, 1, 5}
	fmt.Println(pancakeSort(arr))
}
