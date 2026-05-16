arr := [3, 1, 4, 1, 5, 9, 2, 6]
StoogeSort(arr, 1, arr.Length())

StoogeSort(arr, first, last) {
    if (arr[first] > arr[last]) {
        tmp := arr[first]
        arr[first] := arr[last]
        arr[last] := tmp
    }
    n := last - first + 1
    if (n > 2) {
        t := Floor(n * 2 / 3)
        StoogeSort(arr, first, first + t - 1)
        StoogeSort(arr, last - t + 1, last)
        StoogeSort(arr, first, first + t - 1)
    }
}

result := ""
for i, v in arr
    result .= v . " "
MsgBox % result
