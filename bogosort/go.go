package main

import (
	"fmt"
	"math/rand"
)

func isSorted(arr []int) bool {
	for i := 0; i < len(arr)-1; i++ {
		if arr[i] > arr[i+1] {
			return false
		}
	}
	return true
}

func shuffle(arr []int) {
	rand.Shuffle(len(arr), func(i, j int) {
		arr[i], arr[j] = arr[j], arr[i]
	})
}

func bogosort(arr []int) []int {
	for !isSorted(arr) {
		shuffle(arr)
	}
	return arr
}

func main() {
	arr := []int{3, 1, 4, 1, 5, 9, 2, 6}
	fmt.Println(bogosort(arr))
}
