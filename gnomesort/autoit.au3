Func GnomeSort(ByRef $arr, $n)
    Local $i = 0, $tmp
    While $i < $n
        If $i = 0 Or $arr[$i] >= $arr[$i - 1] Then
            $i += 1
        Else
            $tmp = $arr[$i]
            $arr[$i] = $arr[$i - 1]
            $arr[$i - 1] = $tmp
            $i -= 1
        EndIf
    WEnd
EndFunc
