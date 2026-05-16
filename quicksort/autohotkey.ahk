#NoEnv
SetBatchLines -1

partition(arr, low, high) {
    pivot := arr[high]
    i := low
    Loop % high - low {
        j := low + A_Index - 1
        if (arr[j] <= pivot) {
            tmp := arr[i], arr[i] := arr[j], arr[j] := tmp
            i++
        }
    }
    tmp := arr[i], arr[i] := arr[high], arr[high] := tmp
    return i
}

quicksort(arr, low, high) {
    if (low < high) {
        p := partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)
    }
}

arr := [3, 6, 8, 10, 1, 2, 1]
quicksort(arr, 1, arr.MaxIndex())
result := ""
for _, v in arr
    result .= v . " "
MsgBox % result
