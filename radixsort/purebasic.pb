Procedure CountingSort(Array arr.i(1), exp.i)
  Protected n.i = ArraySize(arr()) + 1
  Dim output.i(n-1)
  Dim cnt.i(9)
  Protected i.i, idx.i
  For i = 0 To n-1
    idx = (arr(i) / exp) % 10
    cnt(idx) + 1
  Next
  For i = 1 To 9
    cnt(i) + cnt(i-1)
  Next
  For i = n-1 To 0 Step -1
    idx = (arr(i) / exp) % 10
    cnt(idx) - 1
    output(cnt(idx)) = arr(i)
  Next
  For i = 0 To n-1
    arr(i) = output(i)
  Next
EndProcedure

Procedure RadixSort(Array arr.i(1))
  Protected maxVal.i = arr(0), exp.i = 1, i.i
  For i = 1 To ArraySize(arr())
    If arr(i) > maxVal : maxVal = arr(i) : EndIf
  Next
  While maxVal / exp > 0
    CountingSort(arr(), exp)
    exp * 10
  Wend
EndProcedure

Dim arr.i(7)
arr(0)=170:arr(1)=45:arr(2)=75:arr(3)=90
arr(4)=802:arr(5)=24:arr(6)=2:arr(7)=66
RadixSort(arr())
For i = 0 To 7
  Print(Str(arr(i)) + " ")
Next
PrintN("")
