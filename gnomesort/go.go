package main

func gnomeSort(arr []int) []int {
	i := 0
	for i < len(arr) {
		if i == 0 || arr[i] >= arr[i-1] {
			i++
		} else {
			arr[i], arr[i-1] = arr[i-1], arr[i]
			i--
		}
	}
	return arr
}
