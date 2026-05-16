#include <Array.au3>

Global $arr[10] = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
Global $n = 10

Func InsertionSort(ByRef $bucket, $m)
    For $i = 1 To $m - 1
        Local $key = $bucket[$i]
        Local $j = $i - 1
        While $j >= 0 And $bucket[$j] > $key
            $bucket[$j + 1] = $bucket[$j]
            $j -= 1
        WEnd
        $bucket[$j + 1] = $key
    Next
EndFunc

Func BucketSort(ByRef $arr, $n)
    Local $minV = $arr[0], $maxV = $arr[0]
    For $i = 0 To $n - 1
        If $arr[$i] < $minV Then $minV = $arr[$i]
        If $arr[$i] > $maxV Then $maxV = $arr[$i]
    Next
    Local $buckets[$n][$n], $counts[$n]
    For $i = 0 To $n - 1
        $counts[$i] = 0
    Next
    For $i = 0 To $n - 1
        Local $idx = Int(($arr[$i] - $minV) / ($maxV - $minV + 1) * $n)
        If $idx >= $n Then $idx = $n - 1
        $buckets[$idx][$counts[$idx]] = $arr[$i]
        $counts[$idx] += 1
    Next
    Local $pos = 0
    For $b = 0 To $n - 1
        Local $tmpBucket[$counts[$b]]
        For $i = 0 To $counts[$b] - 1
            $tmpBucket[$i] = $buckets[$b][$i]
        Next
        InsertionSort($tmpBucket, $counts[$b])
        For $i = 0 To $counts[$b] - 1
            $arr[$pos] = $tmpBucket[$i]
            $pos += 1
        Next
    Next
EndFunc

BucketSort($arr, $n)
Local $out = ""
For $i = 0 To $n - 1
    $out &= $arr[$i] & " "
Next
MsgBox(0, "Sorted", $out)
