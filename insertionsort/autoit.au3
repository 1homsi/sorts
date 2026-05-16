Func InsertionSort(ByRef $arr)
    Local $n = UBound($arr)
    For $i = 1 To $n - 1
        Local $key = $arr[$i]
        Local $j = $i - 1
        While $j >= 0 And $arr[$j] > $key
            $arr[$j + 1] = $arr[$j]
            $j -= 1
        WEnd
        $arr[$j + 1] = $key
    Next
EndFunc
