Procedure.i SelectionSort(Array arr.i(1))
    Protected n.i = ArraySize(arr())
    Protected i.i, j.i, minIdx.i, tmp.i
    For i = 0 To n - 1
        minIdx = i
        For j = i + 1 To n
            If arr(j) < arr(minIdx) : minIdx = j : EndIf
        Next j
        tmp = arr(i) : arr(i) = arr(minIdx) : arr(minIdx) = tmp
    Next i
EndProcedure
