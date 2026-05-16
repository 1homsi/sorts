Module Heapsort
    Sub Heapify(arr() As Integer, n As Integer, i As Integer)
        Dim largest As Integer = i
        Dim left As Integer = 2 * i + 1
        Dim right As Integer = 2 * i + 2
        Dim tmp As Integer
        If left < n AndAlso arr(left) > arr(largest) Then largest = left
        If right < n AndAlso arr(right) > arr(largest) Then largest = right
        If largest <> i Then
            tmp = arr(i) : arr(i) = arr(largest) : arr(largest) = tmp
            Heapify(arr, n, largest)
        End If
    End Sub

    Sub HeapSort(arr() As Integer)
        Dim n As Integer = arr.Length
        Dim i As Integer
        Dim tmp As Integer
        For i = n \ 2 - 1 To 0 Step -1 : Heapify(arr, n, i) : Next
        For i = n - 1 To 1 Step -1
            tmp = arr(0) : arr(0) = arr(i) : arr(i) = tmp
            Heapify(arr, i, 0)
        Next
    End Sub

    Sub Main()
        Dim arr() As Integer = {12, 11, 13, 5, 6, 7}
        HeapSort(arr)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
