Module Module1
    Dim arr() As Integer = {3, 1, 4, 1, 5, 9, 2, 6}

    Sub StoogeSort(first As Integer, last As Integer)
        If arr(first) > arr(last) Then
            Dim tmp As Integer = arr(first)
            arr(first) = arr(last)
            arr(last) = tmp
        End If
        Dim n As Integer = last - first + 1
        If n > 2 Then
            Dim t As Integer = n * 2 \ 3
            StoogeSort(first, first + t - 1)
            StoogeSort(last - t + 1, last)
            StoogeSort(first, first + t - 1)
        End If
    End Sub

    Sub Main()
        StoogeSort(0, arr.Length - 1)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
