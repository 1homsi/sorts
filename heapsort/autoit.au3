Dim $arr[6] = [12, 11, 13, 5, 6, 7]

Func Heapify(ByRef $a, $n, $i)
    Local $largest = $i, $left = 2*$i+1, $right = 2*$i+2, $tmp
    If $left < $n And $a[$left] > $a[$largest] Then $largest = $left
    If $right < $n And $a[$right] > $a[$largest] Then $largest = $right
    If $largest <> $i Then
        $tmp = $a[$i] : $a[$i] = $a[$largest] : $a[$largest] = $tmp
        Heapify($a, $n, $largest)
    EndIf
EndFunc

Func Heapsort(ByRef $a)
    Local $n = UBound($a), $tmp
    For $i = Int($n/2)-1 To 0 Step -1
        Heapify($a, $n, $i)
    Next
    For $i = $n-1 To 1 Step -1
        $tmp = $a[0] : $a[0] = $a[$i] : $a[$i] = $tmp
        Heapify($a, $i, 0)
    Next
EndFunc

Heapsort($arr)
Local $out = ""
For $i = 0 To 5
    $out &= $arr[$i] & " "
Next
MsgBox(0, "Heapsort", $out)
