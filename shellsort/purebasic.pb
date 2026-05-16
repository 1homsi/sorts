Procedure ShellSort(Array arr(1), n.i)
  Protected gap.i, i.i, j.i, temp.i
  gap = n / 2
  While gap > 0
    For i = gap To n - 1
      temp = arr(i)
      j = i
      While j >= gap And arr(j - gap) > temp
        arr(j) = arr(j - gap)
        j - gap
      Wend
      arr(j) = temp
    Next i
    gap / 2
  Wend
EndProcedure

Dim arr(6)
arr(0)=64:arr(1)=34:arr(2)=25:arr(3)=12:arr(4)=22:arr(5)=11:arr(6)=90
ShellSort(arr(), 7)
For i = 0 To 6
  Print(Str(arr(i)) + " ")
Next i
PrintN("")
