package main

import "fmt"

func countingSort(arr []int) []int {
    if len(arr) == 0 { return arr }
    max, min := arr[0], arr[0]
    for _, v := range arr {
        if v > max { max = v }
        if v < min { min = v }
    }
    rang := max - min + 1
    count := make([]int, rang)
    for _, v := range arr { count[v-min]++ }
    for i := 1; i < rang; i++ { count[i] += count[i-1] }
    output := make([]int, len(arr))
    for i := len(arr) - 1; i >= 0; i-- {
        count[arr[i]-min]--
        output[count[arr[i]-min]] = arr[i]
    }
    return output
}

func main() {
    fmt.Println(countingSort([]int{4, 2, 2, 8, 3, 3, 1}))
}
