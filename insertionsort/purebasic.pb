Procedure InsertionSort(Array arr(1), n)
    Protected i, j, key
    For i = 1 To n - 1
        key = arr(i)
        j = i - 1
        While j >= 0 And arr(j) > key
            arr(j + 1) = arr(j)
            j - 1
        Wend
        arr(j + 1) = key
    Next i
EndProcedure
