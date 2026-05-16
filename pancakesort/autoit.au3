#include <Array.au3>

Global $arr[7] = [3, 6, 2, 7, 4, 1, 5]

Func Flip($k)
    Local $left = 0, $right = $k, $tmp
    While $left < $right
        $tmp = $arr[$left]
        $arr[$left] = $arr[$right]
        $arr[$right] = $tmp
        $left += 1
        $right -= 1
    WEnd
EndFunc

Func FindMaxIdx($size)
    Local $maxIdx = 0
    For $i = 1 To $size - 1
        If $arr[$i] > $arr[$maxIdx] Then $maxIdx = $i
    Next
    Return $maxIdx
EndFunc

Local $size = 7
While $size > 1
    Local $maxIdx = FindMaxIdx($size)
    If $maxIdx <> $size - 1 Then
        If $maxIdx <> 0 Then Flip($maxIdx)
        Flip($size - 1)
    EndIf
    $size -= 1
WEnd

_ArrayDisplay($arr)
