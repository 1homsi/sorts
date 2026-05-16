Dim arr.i(6)
arr(0)=3 : arr(1)=6 : arr(2)=8 : arr(3)=10
arr(4)=1 : arr(5)=2 : arr(6)=1

Procedure.i Partition(low.i, high.i)
    pivot.i = arr(high)
    i.i = low
    For j.i = low To high - 1
        If arr(j) <= pivot
            tmp.i = arr(i) : arr(i) = arr(j) : arr(j) = tmp
            i + 1
        EndIf
    Next
    tmp.i = arr(i) : arr(i) = arr(high) : arr(high) = tmp
    ProcedureReturn i
EndProcedure

Procedure QuickSort(low.i, high.i)
    If low < high
        p.i = Partition(low, high)
        QuickSort(low, p - 1)
        QuickSort(p + 1, high)
    EndIf
EndProcedure

QuickSort(0, 6)
For i.i = 0 To 6
    Print(Str(arr(i)) + " ")
Next
PrintN("")
