package main

import "fmt"

func insertionSort(bucket []float64) {
	for i := 1; i < len(bucket); i++ {
		key := bucket[i]
		j := i - 1
		for j >= 0 && bucket[j] > key {
			bucket[j+1] = bucket[j]
			j--
		}
		bucket[j+1] = key
	}
}

func bucketSort(arr []float64) []float64 {
	n := len(arr)
	if n == 0 {
		return arr
	}
	min, max := arr[0], arr[0]
	for _, v := range arr {
		if v < min {
			min = v
		}
		if v > max {
			max = v
		}
	}
	buckets := make([][]float64, n)
	for i := range buckets {
		buckets[i] = []float64{}
	}
	for _, num := range arr {
		idx := int((num - min) / (max - min + 1) * float64(n))
		if idx >= n {
			idx = n - 1
		}
		buckets[idx] = append(buckets[idx], num)
	}
	result := []float64{}
	for _, bucket := range buckets {
		insertionSort(bucket)
		result = append(result, bucket...)
	}
	return result
}

func main() {
	data := []float64{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
	fmt.Println(bucketSort(data))
}
