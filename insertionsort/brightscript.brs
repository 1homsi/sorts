Function InsertionSort(arr As Object) As Object
    n = arr.Count()
    For i = 1 To n - 1
        key = arr[i]
        j = i - 1
        While j >= 0 And arr[j] > key
            arr[j + 1] = arr[j]
            j = j - 1
        End While
        arr[j + 1] = key
    Next i
    Return arr
End Function
