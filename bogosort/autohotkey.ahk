arr := [3, 1, 4, 1, 5, 9, 2, 6]
n := arr.Length()

IsSorted(arr, n) {
    Loop, % n - 1 {
        if (arr[A_Index] > arr[A_Index + 1])
            return false
    }
    return true
}

Shuffle(arr, n) {
    Loop, % n - 1 {
        i := n - A_Index + 1
        j := Random(1, i)
        tmp := arr[i]
        arr[i] := arr[j]
        arr[j] := tmp
    }
}

Random(min, max) {
    Random, r, % min, % max
    return r
}

while (!IsSorted(arr, n))
    Shuffle(arr, n)

result := ""
Loop, % n {
    result .= arr[A_Index] . " "
}
MsgBox % result
