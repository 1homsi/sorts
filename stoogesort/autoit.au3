Dim $arr[8] = [3, 1, 4, 1, 5, 9, 2, 6]
_StoogeSort($arr, 0, UBound($arr) - 1)

Func _StoogeSort(ByRef $arr, $first, $last)
    If $arr[$first] > $arr[$last] Then
        Local $tmp = $arr[$first]
        $arr[$first] = $arr[$last]
        $arr[$last] = $tmp
    EndIf
    Local $n = $last - $first + 1
    If $n > 2 Then
        Local $t = Int($n * 2 / 3)
        _StoogeSort($arr, $first, $first + $t - 1)
        _StoogeSort($arr, $last - $t + 1, $last)
        _StoogeSort($arr, $first, $first + $t - 1)
    EndIf
EndFunc

Local $result = ""
For $i = 0 To UBound($arr) - 1
    $result &= $arr[$i] & " "
Next
MsgBox(0, "Sorted", $result)
