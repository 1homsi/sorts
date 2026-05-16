Module BubbleSort
    Sub BSort(ByRef arr() As Integer)
        Dim n As Integer = arr.Length
        Dim swapped As Boolean
        Dim tmp As Integer
        Do
            swapped = False
            For i As Integer = 0 To n - 2
                If arr(i) > arr(i + 1) Then
                    tmp = arr(i)
                    arr(i) = arr(i + 1)
                    arr(i + 1) = tmp
                    swapped = True
                End If
            Next
            n -= 1
        Loop While swapped
    End Sub

    Sub Main()
        Dim arr() As Integer = {64, 34, 25, 12, 22, 11, 90}
        BSort(arr)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
