Func SelectionSort($arr)
    Local $n = UBound($arr)
    For $i = 0 To $n - 2
        Local $minIdx = $i
        For $j = $i + 1 To $n - 1
            If $arr[$j] < $arr[$minIdx] Then $minIdx = $j
        Next
        Local $tmp = $arr[$i]
        $arr[$i] = $arr[$minIdx]
        $arr[$minIdx] = $tmp
    Next
    Return $arr
EndFunc
