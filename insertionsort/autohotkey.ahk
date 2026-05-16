InsertionSort(arr, n) {
    Loop, % n - 1 {
        i := A_Index
        key := arr[i + 1]
        j := i
        While (j >= 1 && arr[j] > key) {
            arr[j + 1] := arr[j]
            j--
        }
        arr[j + 1] := key
    }
    Return arr
}
