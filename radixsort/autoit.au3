#include <Array.au3>

Func CountingSort(ByRef $arr, $exp)
    Local $n = UBound($arr)
    Local $output[$n], $count[10]
    For $i = 0 To 9
        $count[$i] = 0
    Next
    For $i = 0 To $n - 1
        Local $idx = Int($arr[$i] / $exp) * 10
        $idx = Int($arr[$i] / $exp) - Int(Int($arr[$i] / $exp) / 10) * 10
        $count[$idx] += 1
    Next
    For $i = 1 To 9
        $count[$i] += $count[$i - 1]
    Next
    For $i = $n - 1 To 0 Step -1
        Local $idx = Mod(Int($arr[$i] / $exp), 10)
        $count[$idx] -= 1
        $output[$count[$idx]] = $arr[$i]
    Next
    For $i = 0 To $n - 1
        $arr[$i] = $output[$i]
    Next
EndFunc

Func RadixSort(ByRef $arr)
    Local $n = UBound($arr)
    If $n = 0 Then Return
    Local $maxVal = $arr[0]
    For $i = 1 To $n - 1
        If $arr[$i] > $maxVal Then $maxVal = $arr[$i]
    Next
    Local $exp = 1
    While Int($maxVal / $exp) > 0
        CountingSort($arr, $exp)
        $exp *= 10
    WEnd
EndFunc

Local $arr[8] = [170, 45, 75, 90, 802, 24, 2, 66]
RadixSort($arr)
_ArrayDisplay($arr, "Radix Sort")
