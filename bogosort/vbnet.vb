Module Bogosort
    Function IsSorted(arr As Integer()) As Boolean
        For i As Integer = 0 To arr.Length - 2
            If arr(i) > arr(i + 1) Then Return False
        Next
        Return True
    End Function

    Sub Shuffle(arr As Integer())
        Dim rng As New Random()
        For i As Integer = arr.Length - 1 To 1 Step -1
            Dim j As Integer = rng.Next(i + 1)
            Dim tmp As Integer = arr(i)
            arr(i) = arr(j)
            arr(j) = tmp
        Next
    End Sub

    Sub Main()
        Dim arr As Integer() = {3, 1, 4, 1, 5, 9, 2, 6}
        While Not IsSorted(arr)
            Shuffle(arr)
        End While
        Console.WriteLine(String.Join(", ", arr))
    End Sub
End Module
