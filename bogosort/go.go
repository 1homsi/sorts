func bogosort(arr []int) []int {
    for !isSorted(arr) {
        for i := len(arr) - 1; i > 0; i-- {
            j := rand.Intn(i + 1)
            arr[i], arr[j] = arr[j], arr[i]
        }
    }
    return arr
}

func isSorted(arr []int) bool {
    for i := 0; i < len(arr)-1; i++ {
        if arr[i] > arr[i+1] {
            return false
        }
    }
    return true
}
