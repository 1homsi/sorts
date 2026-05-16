#include <Array.au3>

Func CycleSort(ByRef $arr)
    Local $n = UBound($arr)
    Local $writes = 0
    For $cycleStart = 0 To $n - 2
        Local $item = $arr[$cycleStart]
        Local $pos = $cycleStart
        For $i = $cycleStart + 1 To $n - 1
            If $arr[$i] < $item Then $pos += 1
        Next
        If $pos = $cycleStart Then ContinueLoop
        While $item = $arr[$pos]
            $pos += 1
        WEnd
        Local $tmp = $arr[$pos]
        $arr[$pos] = $item
        $item = $tmp
        $writes += 1
        While $pos <> $cycleStart
            $pos = $cycleStart
            For $i = $cycleStart + 1 To $n - 1
                If $arr[$i] < $item Then $pos += 1
            Next
            While $item = $arr[$pos]
                $pos += 1
            WEnd
            $tmp = $arr[$pos]
            $arr[$pos] = $item
            $item = $tmp
            $writes += 1
        WEnd
    Next
    Return $writes
EndFunc

Local $arr[5] = [5, 4, 3, 2, 1]
CycleSort($arr)
_ArrayDisplay($arr)
