package main

import "fmt"

func countingSort(arr []int, exp int) {
	n := len(arr)
	output := make([]int, n)
	count := make([]int, 10)
	for i := 0; i < n; i++ {
		count[(arr[i]/exp)%10]++
	}
	for i := 1; i < 10; i++ {
		count[i] += count[i-1]
	}
	for i := n - 1; i >= 0; i-- {
		idx := (arr[i] / exp) % 10
		count[idx]--
		output[count[idx]] = arr[i]
	}
	copy(arr, output)
}

func radixSort(arr []int) {
	if len(arr) == 0 {
		return
	}
	max := arr[0]
	for _, v := range arr {
		if v > max {
			max = v
		}
	}
	for exp := 1; max/exp > 0; exp *= 10 {
		countingSort(arr, exp)
	}
}

func main() {
	arr := []int{170, 45, 75, 90, 802, 24, 2, 66}
	radixSort(arr)
	fmt.Println(arr)
}
