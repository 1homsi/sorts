CombSort(arr, n) {
    gap := n
    sorted := false
    while (!sorted) {
        gap := Floor(gap / 1.3)
        if (gap <= 1) {
            gap := 1
            sorted := true
        }
        Loop, % n - gap {
            i := A_Index
            j := i + gap
            if (arr[i] > arr[j]) {
                tmp := arr[i]
                arr[i] := arr[j]
                arr[j] := tmp
                sorted := false
            }
        }
    }
    return arr
}
