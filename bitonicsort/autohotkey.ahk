arr := [3, 7, 4, 8, 6, 2, 1, 5]

CompareAndSwap(arr, i, j, direction) {
    ai := arr[i], aj := arr[j]
    if (direction == (ai > aj)) {
        arr[i] := aj, arr[j] := ai
    }
}

BitonicMerge(arr, lo, cnt, direction) {
    if (cnt > 1) {
        k := cnt // 2
        Loop k {
            i := lo + A_Index - 1
            CompareAndSwap(arr, i, i + k, direction)
        }
        BitonicMerge(arr, lo, k, direction)
        BitonicMerge(arr, lo + k, k, direction)
    }
}

BitonicSort(arr, lo, cnt, direction) {
    if (cnt > 1) {
        k := cnt // 2
        BitonicSort(arr, lo, k, true)
        BitonicSort(arr, lo + k, k, false)
        BitonicMerge(arr, lo, cnt, direction)
    }
}

BitonicSort(arr, 1, arr.Length, true)

result := ""
for v in arr
    result .= v " "
MsgBox result
