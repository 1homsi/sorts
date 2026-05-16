Module PancakeSort
    Sub Flip(arr() As Integer, k As Integer)
        Dim left As Integer = 0, right As Integer = k, tmp As Integer
        Do While left < right
            tmp = arr(left) : arr(left) = arr(right) : arr(right) = tmp
            left += 1 : right -= 1
        Loop
    End Sub

    Sub PancakeSortSub(arr() As Integer)
        Dim size As Integer = arr.Length
        Do While size > 1
            Dim maxIdx As Integer = 0
            For i As Integer = 1 To size - 1
                If arr(i) > arr(maxIdx) Then maxIdx = i
            Next
            If maxIdx <> size - 1 Then
                If maxIdx <> 0 Then Flip(arr, maxIdx)
                Flip(arr, size - 1)
            End If
            size -= 1
        Loop
    End Sub

    Sub Main()
        Dim arr() As Integer = {3, 6, 2, 7, 4, 1, 5}
        PancakeSortSub(arr)
        Console.WriteLine(String.Join(", ", arr))
    End Sub
End Module
