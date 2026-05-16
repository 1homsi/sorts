package main

import "fmt"

func quicksort(arr []int, low, high int) {
	if low < high {
		p := partition(arr, low, high)
		quicksort(arr, low, p-1)
		quicksort(arr, p+1, high)
	}
}

func partition(arr []int, low, high int) int {
	pivot := arr[high]
	i := low
	for j := low; j < high; j++ {
		if arr[j] <= pivot {
			arr[i], arr[j] = arr[j], arr[i]
			i++
		}
	}
	arr[i], arr[high] = arr[high], arr[i]
	return i
}

func main() {
	arr := []int{3, 6, 8, 10, 1, 2, 1}
	quicksort(arr, 0, len(arr)-1)
	fmt.Println(arr)
}
