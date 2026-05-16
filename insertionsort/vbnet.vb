Public Sub InsertionSort(ByRef arr() As Integer)
    Dim n As Integer = arr.Length
    For i As Integer = 1 To n - 1
        Dim key As Integer = arr(i)
        Dim j As Integer = i - 1
        While j >= 0 AndAlso arr(j) > key
            arr(j + 1) = arr(j)
            j -= 1
        End While
        arr(j + 1) = key
    Next
End Sub
