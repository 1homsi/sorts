Dim arr(7)
arr(0) = 3 : arr(1) = 7 : arr(2) = 4 : arr(3) = 8
arr(4) = 6 : arr(5) = 2 : arr(6) = 1 : arr(7) = 5

Sub CompareAndSwap(i, j, dir)
    Dim tmp
    If (dir = 1 And arr(i) > arr(j)) Or (dir = 0 And arr(i) < arr(j)) Then
        tmp = arr(i) : arr(i) = arr(j) : arr(j) = tmp
    End If
End Sub

Sub BitonicMerge(lo, cnt, dir)
    Dim k, i
    If cnt > 1 Then
        k = Int(cnt / 2)
        For i = lo To lo + k - 1
            CompareAndSwap i, i + k, dir
        Next
        BitonicMerge lo, k, dir
        BitonicMerge lo + k, k, dir
    End If
End Sub

Sub BitonicSort(lo, cnt, dir)
    Dim k
    If cnt > 1 Then
        k = Int(cnt / 2)
        BitonicSort lo, k, 1
        BitonicSort lo + k, k, 0
        BitonicMerge lo, cnt, dir
    End If
End Sub

BitonicSort 0, 8, 1
Dim result : result = ""
Dim idx
For idx = 0 To 7
    result = result & arr(idx) & " "
Next
WScript.Echo result
