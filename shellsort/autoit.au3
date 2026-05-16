#include <Array.au3>

Func ShellSort(ByRef $arr)
    Local $n = UBound($arr)
    Local $gap = Int($n / 2)
    While $gap > 0
        For $i = $gap To $n - 1
            Local $temp = $arr[$i]
            Local $j = $i
            While $j >= $gap And $arr[$j - $gap] > $temp
                $arr[$j] = $arr[$j - $gap]
                $j -= $gap
            WEnd
            $arr[$j] = $temp
        Next
        $gap = Int($gap / 2)
    WEnd
EndFunc

Local $arr[7] = [64, 34, 25, 12, 22, 11, 90]
ShellSort($arr)
_ArrayDisplay($arr)
