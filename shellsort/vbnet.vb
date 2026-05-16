Public Shared Sub Shellsort(arr As Integer())
    Dim n As Integer = arr.Length
    Dim gap As Integer = n / 2
    While gap > 0
        For i = gap To n - 1
            Dim temp As Integer = arr(i)
            Dim j As Integer = i
            While j >= gap AndAlso arr(j - gap) > temp
                arr(j) = arr(j - gap)
                j -= gap
            End While
            arr(j) = temp
        Next
        gap = gap / 2
    End While
End Sub
