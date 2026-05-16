class SelectionSort {
    static Int[] selectionSort(Int[] arr) {
        n := arr.size
        for (i := 0; i < n; i++) {
            minIdx := i
            for (j := i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx]) minIdx = j
            }
            tmp := arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp
        }
        return arr
    }
}
