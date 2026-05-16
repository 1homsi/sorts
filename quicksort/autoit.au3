Func _partition(ByRef $arr, $low, $high)
    Local $pivot = $arr[$high]
    Local $i = $low, $tmp
    For $j = $low To $high - 1
        If $arr[$j] <= $pivot Then
            $tmp = $arr[$i]; $arr[$i] = $arr[$j]; $arr[$j] = $tmp
            $i += 1
        EndIf
    Next
    $tmp = $arr[$i]; $arr[$i] = $arr[$high]; $arr[$high] = $tmp
    Return $i
EndFunc

Func _quicksort(ByRef $arr, $low, $high)
    If $low < $high Then
        Local $p = _partition($arr, $low, $high)
        _quicksort($arr, $low, $p - 1)
        _quicksort($arr, $p + 1, $high)
    EndIf
EndFunc

Local $arr[7] = [3, 6, 8, 10, 1, 2, 1]
_quicksort($arr, 0, 6)
Local $result = ""
For $i = 0 To 6
    $result &= $arr[$i] & " "
Next
MsgBox(0, "Sorted", $result)
