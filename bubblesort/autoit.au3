#include <Array.au3>

Func BubbleSort(ByRef $arr)
    Local $n = UBound($arr), $swapped, $tmp
    Do
        $swapped = False
        For $i = 0 To $n - 2
            If $arr[$i] > $arr[$i + 1] Then
                $tmp = $arr[$i]
                $arr[$i] = $arr[$i + 1]
                $arr[$i + 1] = $tmp
                $swapped = True
            EndIf
        Next
        $n -= 1
    Until Not $swapped
EndFunc

Local $arr[7] = [64, 34, 25, 12, 22, 11, 90]
BubbleSort($arr)
_ArrayDisplay($arr, "Sorted")
