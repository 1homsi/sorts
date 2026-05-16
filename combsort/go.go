package main

func combSort(arr []int) []int {
	n := len(arr)
	gap := n
	shrink := 1.3
	sorted := false
	for !sorted {
		gap = int(float64(gap) / shrink)
		if gap <= 1 {
			gap = 1
			sorted = true
		}
		for i := 0; i+gap < n; i++ {
			if arr[i] > arr[i+gap] {
				arr[i], arr[i+gap] = arr[i+gap], arr[i]
				sorted = false
			}
		}
	}
	return arr
}
