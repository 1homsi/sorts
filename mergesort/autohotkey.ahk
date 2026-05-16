MergeSort(arr, lo, hi) {
    if (lo >= hi)
        return
    mid := (lo + hi) // 2
    MergeSort(arr, lo, mid)
    MergeSort(arr, mid + 1, hi)
    Merge(arr, lo, mid, hi)
}

Merge(arr, lo, mid, hi) {
    tmp := []
    i := lo, j := mid + 1, k := 1
    while (i <= mid && j <= hi) {
        if (arr[i] <= arr[j]) {
            tmp[k++] := arr[i++]
        } else {
            tmp[k++] := arr[j++]
        }
    }
    while (i <= mid)
        tmp[k++] := arr[i++]
    while (j <= hi)
        tmp[k++] := arr[j++]
    Loop hi - lo + 1
        arr[lo + A_Index - 1] := tmp[A_Index]
}

arr := [38, 27, 43, 3, 9, 82, 10]
MergeSort(arr, 1, arr.Length)
output := ""
for v in arr
    output .= v " "
MsgBox output
