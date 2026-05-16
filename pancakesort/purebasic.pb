Global Dim arr.i(6)
arr(0)=3 : arr(1)=6 : arr(2)=2 : arr(3)=7
arr(4)=4 : arr(5)=1 : arr(6)=5

Procedure Flip(k.i)
    Protected left.i=0, right.i=k, tmp.i
    While left < right
        tmp=arr(left) : arr(left)=arr(right) : arr(right)=tmp
        left+1 : right-1
    Wend
EndProcedure

Procedure.i FindMaxIdx(size.i)
    Protected maxIdx.i=0, i.i
    For i=1 To size-1
        If arr(i) > arr(maxIdx) : maxIdx=i : EndIf
    Next
    ProcedureReturn maxIdx
EndProcedure

Define size.i=7, maxIdx.i, i.i
While size > 1
    maxIdx = FindMaxIdx(size)
    If maxIdx <> size-1
        If maxIdx <> 0 : Flip(maxIdx) : EndIf
        Flip(size-1)
    EndIf
    size-1
Wend

For i=0 To 6 : Print(Str(arr(i))+" ") : Next
PrintN("")
