Dim arr(6), tmp(6)
arr(0)=38: arr(1)=27: arr(2)=43: arr(3)=3
arr(4)=9: arr(5)=82: arr(6)=10

MergeSort(0, 6)

For i = 0 To 6
    Print arr(i)
Next i

Function MergeSort(lo, hi)
    If lo >= hi Then Return
    mid = (lo + hi) / 2
    MergeSort(lo, mid)
    MergeSort(mid + 1, hi)
    Merge(lo, mid, hi)
End Function

Function Merge(lo, mid, hi)
    i = lo: j = mid + 1: k = lo
    While i <= mid And j <= hi
        If arr(i) <= arr(j) Then
            tmp(k) = arr(i): i = i + 1
        Else
            tmp(k) = arr(j): j = j + 1
        EndIf
        k = k + 1
    Wend
    While i <= mid: tmp(k) = arr(i): i = i+1: k = k+1: Wend
    While j <= hi: tmp(k) = arr(j): j = j+1: k = k+1: Wend
    For x = lo To hi: arr(x) = tmp(x): Next x
End Function
