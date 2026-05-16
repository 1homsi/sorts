package main

import "fmt"

func cycleSort(arr []int) int {
	writes := 0
	n := len(arr)
	for cycleStart := 0; cycleStart < n-1; cycleStart++ {
		item := arr[cycleStart]
		pos := cycleStart
		for i := cycleStart + 1; i < n; i++ {
			if arr[i] < item {
				pos++
			}
		}
		if pos == cycleStart {
			continue
		}
		for item == arr[pos] {
			pos++
		}
		arr[pos], item = item, arr[pos]
		writes++
		for pos != cycleStart {
			pos = cycleStart
			for i := cycleStart + 1; i < n; i++ {
				if arr[i] < item {
					pos++
				}
			}
			for item == arr[pos] {
				pos++
			}
			arr[pos], item = item, arr[pos]
			writes++
		}
	}
	return writes
}

func main() {
	arr := []int{5, 4, 3, 2, 1}
	cycleSort(arr)
	fmt.Println(arr)
}
