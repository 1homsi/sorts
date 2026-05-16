Global Dim arr.i(6), tmp.i(6)

arr(0)=38: arr(1)=27: arr(2)=43: arr(3)=3
arr(4)=9: arr(5)=82: arr(6)=10

Procedure Merge(lo.i, mid.i, hi.i)
    Protected i.i = lo, j.i = mid + 1, k.i = lo, x.i
    While i <= mid And j <= hi
        If arr(i) <= arr(j)
            tmp(k) = arr(i): i + 1
        Else
            tmp(k) = arr(j): j + 1
        EndIf
        k + 1
    Wend
    While i <= mid: tmp(k) = arr(i): i + 1: k + 1: Wend
    While j <= hi: tmp(k) = arr(j): j + 1: k + 1: Wend
    For x = lo To hi: arr(x) = tmp(x): Next x
EndProcedure

Procedure MergeSort(lo.i, hi.i)
    Protected mid.i
    If lo >= hi: ProcedureReturn: EndIf
    mid = (lo + hi) / 2
    MergeSort(lo, mid)
    MergeSort(mid + 1, hi)
    Merge(lo, mid, hi)
EndProcedure

MergeSort(0, 6)
For i.i = 0 To 6: Print(Str(arr(i)) + " "): Next i
PrintN("")
