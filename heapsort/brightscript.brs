Sub Heapify(arr As Object, n As Integer, i As Integer)
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    If left < n And arr[left] > arr[largest] Then largest = left
    If right < n And arr[right] > arr[largest] Then largest = right
    If largest <> i Then
        tmp = arr[i] : arr[i] = arr[largest] : arr[largest] = tmp
        Heapify(arr, n, largest)
    End If
End Sub

Sub Heapsort(arr As Object)
    n = arr.Count()
    For i = Int(n/2) - 1 To 0 Step -1
        Heapify(arr, n, i)
    End For
    For i = n - 1 To 1 Step -1
        tmp = arr[0] : arr[0] = arr[i] : arr[i] = tmp
        Heapify(arr, i, 0)
    End For
End Sub

Sub Main()
    arr = [12, 11, 13, 5, 6, 7]
    Heapsort(arr)
    print arr
End Sub
