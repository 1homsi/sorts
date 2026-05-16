Dim arr.i(6)
arr(0)=64 : arr(1)=34 : arr(2)=25 : arr(3)=12
arr(4)=22 : arr(5)=11 : arr(6)=90
n.i = 7
Repeat
    sw.i = 0
    For i.i = 0 To n - 2
        If arr(i) > arr(i+1)
            t.i = arr(i) : arr(i) = arr(i+1) : arr(i+1) = t : sw = 1
        EndIf
    Next i
    n - 1
Until sw = 0
For i.i = 0 To 6
    Print(Str(arr(i)) + " ")
Next i
PrintN("")
