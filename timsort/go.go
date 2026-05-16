package main

import "fmt"

const minRun = 32

func insertionSort(arr []int, left, right int) {
	for i := left + 1; i <= right; i++ {
		key := arr[i]
		j := i - 1
		for j >= left && arr[j] > key {
			arr[j+1] = arr[j]
			j--
		}
		arr[j+1] = key
	}
}

func merge(arr []int, left, mid, right int) {
	leftPart := make([]int, mid-left+1)
	rightPart := make([]int, right-mid)
	copy(leftPart, arr[left:mid+1])
	copy(rightPart, arr[mid+1:right+1])
	i, j, k := 0, 0, left
	for i < len(leftPart) && j < len(rightPart) {
		if leftPart[i] <= rightPart[j] {
			arr[k] = leftPart[i]
			i++
		} else {
			arr[k] = rightPart[j]
			j++
		}
		k++
	}
	for i < len(leftPart) {
		arr[k] = leftPart[i]
		i++
		k++
	}
	for j < len(rightPart) {
		arr[k] = rightPart[j]
		j++
		k++
	}
}

func timsort(arr []int) {
	n := len(arr)
	for i := 0; i < n; i += minRun {
		right := i + minRun - 1
		if right >= n {
			right = n - 1
		}
		insertionSort(arr, i, right)
	}
	for size := minRun; size < n; size *= 2 {
		for left := 0; left < n; left += 2 * size {
			mid := left + size - 1
			if mid >= n {
				mid = n - 1
			}
			right := left + 2*size - 1
			if right >= n {
				right = n - 1
			}
			if mid < right {
				merge(arr, left, mid, right)
			}
		}
	}
}

func main() {
	arr := []int{5, 2, 8, 1, 9, 3, 7, 4, 6}
	timsort(arr)
	fmt.Println(arr)
}
