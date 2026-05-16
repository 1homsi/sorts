Sub QuickSort(arr, low, high)
    If low >= high Then Exit Sub
    Dim pivot, i, j, tmp
    pivot = arr(high)
    i = low
    For j = low To high - 1
        If arr(j) <= pivot Then
            tmp = arr(i) : arr(i) = arr(j) : arr(j) = tmp
            i = i + 1
        End If
    Next
    tmp = arr(i) : arr(i) = arr(high) : arr(high) = tmp
    QuickSort arr, low, i - 1
    QuickSort arr, i + 1, high
End Sub

Dim arr(6)
arr(0) = 3 : arr(1) = 6 : arr(2) = 8 : arr(3) = 10
arr(4) = 1 : arr(5) = 2 : arr(6) = 1
QuickSort arr, 0, 6
Dim i
For i = 0 To 6
    WScript.Echo arr(i)
Next
