Procedure CycleSort(Array arr(1))
    Protected n.i, cs.i, item.i, pos.i, i.i, tmp.i, writes.i
    n = ArraySize(arr()) + 1
    writes = 0
    For cs = 0 To n - 2
        item = arr(cs)
        pos = cs
        For i = cs + 1 To n - 1
            If arr(i) < item : pos + 1 : EndIf
        Next i
        If pos = cs : Continue : EndIf
        While arr(pos) = item : pos + 1 : Wend
        tmp = arr(pos) : arr(pos) = item : item = tmp
        writes + 1
        While pos <> cs
            pos = cs
            For i = cs + 1 To n - 1
                If arr(i) < item : pos + 1 : EndIf
            Next i
            While arr(pos) = item : pos + 1 : Wend
            tmp = arr(pos) : arr(pos) = item : item = tmp
            writes + 1
        Wend
    Next cs
EndProcedure

Dim arr(4)
arr(0) = 5 : arr(1) = 4 : arr(2) = 3 : arr(3) = 2 : arr(4) = 1
CycleSort(arr())
For i = 0 To 4
    Print(Str(arr(i)) + " ")
Next i
PrintN("")
