Procedure GnomeSort(Array arr.i(1), n.i)
    i.i = 0
    Repeat
        If i = 0 Or arr(i) >= arr(i - 1)
            i + 1
        Else
            tmp.i = arr(i)
            arr(i) = arr(i - 1)
            arr(i - 1) = tmp
            i - 1
        EndIf
    Until i >= n
EndProcedure
