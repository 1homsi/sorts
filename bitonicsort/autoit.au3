Dim $arr[8] = [3, 7, 4, 8, 6, 2, 1, 5]

Func CompareAndSwap($i, $j, $dir)
    If $dir = ($arr[$i] > $arr[$j]) Then
        Local $tmp = $arr[$i]
        $arr[$i] = $arr[$j]
        $arr[$j] = $tmp
    EndIf
EndFunc

Func BitonicMerge($lo, $cnt, $dir)
    If $cnt > 1 Then
        Local $k = Int($cnt / 2)
        For $i = $lo To $lo + $k - 1
            CompareAndSwap($i, $i + $k, $dir)
        Next
        BitonicMerge($lo, $k, $dir)
        BitonicMerge($lo + $k, $k, $dir)
    EndIf
EndFunc

Func BitonicSort($lo, $cnt, $dir)
    If $cnt > 1 Then
        Local $k = Int($cnt / 2)
        BitonicSort($lo, $k, True)
        BitonicSort($lo + $k, $k, False)
        BitonicMerge($lo, $cnt, $dir)
    EndIf
EndFunc

BitonicSort(0, 8, True)

Local $result = ""
For $i = 0 To 7
    $result &= $arr[$i] & " "
Next
MsgBox(0, "Result", $result)
