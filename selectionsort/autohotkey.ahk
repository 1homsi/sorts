SelectionSort(arr, n) {
    Loop % n - 1 {
        i := A_Index
        minIdx := i
        Loop % n - i {
            j := i + A_Index
            if (arr[j] < arr[minIdx])
                minIdx := j
        }
        tmp := arr[i], arr[i] := arr[minIdx], arr[minIdx] := tmp
    }
    return arr
}
