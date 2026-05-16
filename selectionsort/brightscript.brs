Function SelectionSort(arr As Object) As Object
    n = arr.Count()
    For i = 0 To n - 2
        minIdx = i
        For j = i + 1 To n - 1
            If arr[j] < arr[minIdx] Then minIdx = j
        Next j
        tmp = arr[i]: arr[i] = arr[minIdx]: arr[minIdx] = tmp
    Next i
    Return arr
End Function
