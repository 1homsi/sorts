Function partition(arr As Object, low As Integer, high As Integer) As Integer
    pivot = arr[high]
    i = low
    For j = low To high - 1
        If arr[j] <= pivot Then
            tmp = arr[i]
            arr[i] = arr[j]
            arr[j] = tmp
            i = i + 1
        End If
    End For
    tmp = arr[i]
    arr[i] = arr[high]
    arr[high] = tmp
    Return i
End Function

Sub quicksort(arr As Object, low As Integer, high As Integer)
    If low < high Then
        p = partition(arr, low, high)
        quicksort(arr, low, p - 1)
        quicksort(arr, p + 1, high)
    End If
End Sub

Sub Main()
    arr = [3, 6, 8, 10, 1, 2, 1]
    quicksort(arr, 0, arr.Count() - 1)
    Print arr
End Sub
