Dim arr(7)
arr(0) = 3 : arr(1) = 1 : arr(2) = 4 : arr(3) = 1
arr(4) = 5 : arr(5) = 9 : arr(6) = 2 : arr(7) = 6

Procedure.b IsSorted()
  n = 8
  For i = 0 To n - 2
    If arr(i) > arr(i + 1)
      ProcedureReturn #False
    EndIf
  Next i
  ProcedureReturn #True
EndProcedure

Procedure Shuffle()
  n = 8
  For i = n - 1 To 1 Step -1
    j = Random(i)
    tmp = arr(i) : arr(i) = arr(j) : arr(j) = tmp
  Next i
EndProcedure

Repeat
  If Not IsSorted() : Shuffle() : EndIf
Until IsSorted()

For i = 0 To 7
  Print(Str(arr(i)) + " ")
Next i
PrintN("")
