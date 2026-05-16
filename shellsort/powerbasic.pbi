Function ShellSort(arr() As Long, n As Long) As Long
    Dim gap As Long, i As Long, j As Long, temp As Long
    gap = n \ 2
    Do While gap > 0
        For i = gap To n - 1
            temp = arr(i)
            j = i
            Do While j >= gap And arr(j - gap) > temp
                arr(j) = arr(j - gap)
                j = j - gap
            Loop
            arr(j) = temp
        Next i
        gap = gap \ 2
    Loop
    Function = 0
End Function

Dim arr(6) As Long
arr(0)=64:arr(1)=34:arr(2)=25:arr(3)=12:arr(4)=22:arr(5)=11:arr(6)=90
ShellSort(arr(), 7)
Dim i As Long
For i = 0 To 6
    Print arr(i); " ";
Next i
Print
