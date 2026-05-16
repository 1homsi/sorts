#NoEnv
SetBatchLines -1

arr := [3, 6, 2, 7, 4, 1, 5]
n := arr.MaxIndex()

Flip(ByRef arr, k) {
    left := 1, right := k + 1
    while (left < right) {
        tmp := arr[left]
        arr[left] := arr[right]
        arr[right] := tmp
        left++, right--
    }
}

FindMaxIdx(ByRef arr, size) {
    maxIdx := 1
    Loop, % size - 1 {
        i := A_Index + 1
        if (arr[i] > arr[maxIdx])
            maxIdx := i
    }
    return maxIdx
}

size := n
while (size > 1) {
    maxIdx := FindMaxIdx(arr, size)
    if (maxIdx != size) {
        if (maxIdx != 1)
            Flip(arr, maxIdx - 1)
        Flip(arr, size - 1)
    }
    size--
}

result := ""
Loop, % n
    result .= arr[A_Index] . " "
MsgBox, % result
