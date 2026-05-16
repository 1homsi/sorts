Const $MIN_RUN = 32

Func InsertionSort(ByRef $arr, $left, $right)
    For $i = $left + 1 To $right
        $key = $arr[$i]
        $j = $i - 1
        While $j >= $left And $arr[$j] > $key
            $arr[$j + 1] = $arr[$j]
            $j -= 1
        WEnd
        $arr[$j + 1] = $key
    Next
EndFunc

Func Merge(ByRef $arr, $left, $mid, $right)
    Local $ln = $mid - $left + 1
    Local $rn = $right - $mid
    Local $lp[$ln], $rp[$rn]
    For $i = 0 To $ln - 1
        $lp[$i] = $arr[$left + $i]
    Next
    For $i = 0 To $rn - 1
        $rp[$i] = $arr[$mid + 1 + $i]
    Next
    Local $i = 0, $j = 0, $k = $left
    While $i < $ln And $j < $rn
        If $lp[$i] <= $rp[$j] Then
            $arr[$k] = $lp[$i]
            $i += 1
        Else
            $arr[$k] = $rp[$j]
            $j += 1
        EndIf
        $k += 1
    WEnd
    While $i < $ln
        $arr[$k] = $lp[$i]
        $i += 1
        $k += 1
    WEnd
    While $j < $rn
        $arr[$k] = $rp[$j]
        $j += 1
        $k += 1
    WEnd
EndFunc

Func Timsort(ByRef $arr)
    Local $n = UBound($arr)
    Local $i = 0
    While $i < $n
        Local $right = $i + $MIN_RUN - 1
        If $right >= $n Then $right = $n - 1
        InsertionSort($arr, $i, $right)
        $i += $MIN_RUN
    WEnd
    Local $size = $MIN_RUN
    While $size < $n
        Local $left = 0
        While $left < $n
            Local $mid = $left + $size - 1
            If $mid >= $n Then $mid = $n - 1
            Local $r = $left + 2 * $size - 1
            If $r >= $n Then $r = $n - 1
            If $mid < $r Then Merge($arr, $left, $mid, $r)
            $left += 2 * $size
        WEnd
        $size *= 2
    WEnd
EndFunc

Local $arr[9] = [5, 2, 8, 1, 9, 3, 7, 4, 6]
Timsort($arr)
Local $out = ""
For $i = 0 To UBound($arr) - 1
    $out &= $arr[$i] & " "
Next
MsgBox(0, "", StringStripWS($out, 2))
