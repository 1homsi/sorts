Function StoogeSort(arr As Object, first As Integer, last As Integer) As Void
    If arr[first] > arr[last] Then
        tmp = arr[first]
        arr[first] = arr[last]
        arr[last] = tmp
    End If
    n = last - first + 1
    If n > 2 Then
        t = Int(n * 2 / 3)
        StoogeSort(arr, first, first + t - 1)
        StoogeSort(arr, last - t + 1, last)
        StoogeSort(arr, first, first + t - 1)
    End If
End Function

arr = [3, 1, 4, 1, 5, 9, 2, 6]
StoogeSort(arr, 0, arr.Count() - 1)
print arr
