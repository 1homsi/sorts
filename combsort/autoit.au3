Func CombSort(ByRef $arr, $n)
    Local $gap = $n
    Local $sorted = False
    While Not $sorted
        $gap = Int($gap / 1.3)
        If $gap <= 1 Then
            $gap = 1
            $sorted = True
        EndIf
        For $i = 0 To $n - $gap - 1
            If $arr[$i] > $arr[$i + $gap] Then
                Local $tmp = $arr[$i]
                $arr[$i] = $arr[$i + $gap]
                $arr[$i + $gap] = $tmp
                $sorted = False
            EndIf
        Next
    WEnd
EndFunc
