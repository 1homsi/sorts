Dim arr(7)
arr(0)=3 : arr(1)=7 : arr(2)=4 : arr(3)=8
arr(4)=6 : arr(5)=2 : arr(6)=1 : arr(7)=5

BitonicSort(0, 8, 1)

For i=0 To 7
    Print arr(i)
Next

End

Function BitonicSort(lo, cnt, dir)
    If cnt > 1
        k = cnt / 2
        BitonicSort(lo, k, 1)
        BitonicSort(lo+k, k, 0)
        BitonicMerge(lo, cnt, dir)
    EndIf
End Function

Function BitonicMerge(lo, cnt, dir)
    If cnt > 1
        k = cnt / 2
        For i = lo To lo+k-1
            CompSwap(i, i+k, dir)
        Next
        BitonicMerge(lo, k, dir)
        BitonicMerge(lo+k, k, dir)
    EndIf
End Function

Function CompSwap(i, j, dir)
    If (dir=1 And arr(i)>arr(j)) Or (dir=0 And arr(i)<arr(j))
        t = arr(i) : arr(i) = arr(j) : arr(j) = t
    EndIf
End Function
