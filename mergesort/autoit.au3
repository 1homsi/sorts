Func Merge(ByRef $arr, $lo, $mid, $hi)
    Local $tmp[7]
    Local $i = $lo, $j = $mid + 1, $k = $lo
    While $i <= $mid And $j <= $hi
        If $arr[$i] <= $arr[$j] Then
            $tmp[$k] = $arr[$i]; $i += 1
        Else
            $tmp[$k] = $arr[$j]; $j += 1
        EndIf
        $k += 1
    WEnd
    While $i <= $mid
        $tmp[$k] = $arr[$i]; $i += 1; $k += 1
    WEnd
    While $j <= $hi
        $tmp[$k] = $arr[$j]; $j += 1; $k += 1
    WEnd
    For $x = $lo To $hi
        $arr[$x] = $tmp[$x]
    Next
EndFunc

Func MergeSort(ByRef $arr, $lo, $hi)
    If $lo >= $hi Then Return
    Local $mid = Int(($lo + $hi) / 2)
    MergeSort($arr, $lo, $mid)
    MergeSort($arr, $mid + 1, $hi)
    Merge($arr, $lo, $mid, $hi)
EndFunc

Local $arr[7] = [38, 27, 43, 3, 9, 82, 10]
MergeSort($arr, 0, 6)
For $i = 0 To 6
    ConsoleWrite($arr[$i] & " ")
Next
ConsoleWrite(@LF)
