#include <Array.au3>

Dim $arr[8] = [3, 1, 4, 1, 5, 9, 2, 6]

Func IsSorted(ByRef $a)
    For $i = 0 To UBound($a) - 2
        If $a[$i] > $a[$i + 1] Then Return False
    Next
    Return True
EndFunc

Func Shuffle(ByRef $a)
    Local $n = UBound($a)
    For $i = $n - 1 To 1 Step -1
        Local $j = Random(0, $i, 1)
        Local $tmp = $a[$i]
        $a[$i] = $a[$j]
        $a[$j] = $tmp
    Next
EndFunc

While Not IsSorted($arr)
    Shuffle($arr)
WEnd

_ArrayDisplay($arr, "Bogosort Result")
