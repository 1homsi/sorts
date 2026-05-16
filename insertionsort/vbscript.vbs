Function InsertionSort(arr)
    Dim n, i, j, key
    n = UBound(arr)
    For i = 1 To n
        key = arr(i)
        j = i - 1
        Do While j >= 0 And arr(j) > key
            arr(j + 1) = arr(j)
            j = j - 1
        Loop
        arr(j + 1) = key
    Next
    InsertionSort = arr
End Function
