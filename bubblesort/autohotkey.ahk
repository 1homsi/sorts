arr := [64, 34, 25, 12, 22, 11, 90]
n := arr.Length()
swapped := true
while swapped {
    swapped := false
    loop % n - 1 {
        i := A_Index
        if (arr[i] > arr[i+1]) {
            tmp := arr[i]
            arr[i] := arr[i+1]
            arr[i+1] := tmp
            swapped := true
        }
    }
    n--
}
result := ""
for _, v in arr
    result .= v . " "
MsgBox % result
