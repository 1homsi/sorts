Module Quicksort
    Sub QuickSort(arr() As Integer, low As Integer, high As Integer)
        If low >= high Then Return
        Dim pivot As Integer = arr(high)
        Dim i As Integer = low
        For j As Integer = low To high - 1
            If arr(j) <= pivot Then
                Dim tmp As Integer = arr(i) : arr(i) = arr(j) : arr(j) = tmp
                i += 1
            End If
        Next
        Dim t As Integer = arr(i) : arr(i) = arr(high) : arr(high) = t
        QuickSort(arr, low, i - 1)
        QuickSort(arr, i + 1, high)
    End Sub

    Sub Main()
        Dim arr() As Integer = {3, 6, 8, 10, 1, 2, 1}
        QuickSort(arr, 0, arr.Length - 1)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
