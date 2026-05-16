ShellSort(arr, n) {
    gap := n // 2
    while (gap > 0) {
        Loop, % n - gap {
            i := A_Index + gap - 1
            temp := arr[i]
            j := i
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] := arr[j - gap]
                j -= gap
            }
            arr[j] := temp
        }
        gap := gap // 2
    }
}

arr := [64, 34, 25, 12, 22, 11, 90]
n := arr.MaxIndex()
ShellSort(arr, n)
result := ""
Loop, % n {
    result .= arr[A_Index] . " "
}
MsgBox, % result
