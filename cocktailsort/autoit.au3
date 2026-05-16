Func CocktailSort(ByRef $arr, $n)
    Local $swapped = True
    Local $start = 0
    Local $end = $n - 1
    Local $tmp
    While $swapped
        $swapped = False
        For $i = $start To $end - 1
            If $arr[$i] > $arr[$i + 1] Then
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + 1]
                $arr[$i + 1] = $tmp
                $swapped = True
            EndIf
        Next
        If Not $swapped Then ExitLoop
        $swapped = False
        $end -= 1
        For $i = $end - 1 To $start Step -1
            If $arr[$i] > $arr[$i + 1] Then
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + 1]
                $arr[$i + 1] = $tmp
                $swapped = True
            EndIf
        Next
        $start += 1
    WEnd
EndFunc
