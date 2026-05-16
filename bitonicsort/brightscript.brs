Sub CompareAndSwap(arr As Object, i As Integer, j As Integer, direction As Boolean)
    If direction = (arr[i] > arr[j]) Then
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    End If
End Sub

Sub BitonicMerge(arr As Object, lo As Integer, cnt As Integer, direction As Boolean)
    If cnt > 1 Then
        k = Int(cnt / 2)
        For i = lo To lo + k - 1
            CompareAndSwap(arr, i, i + k, direction)
        Next i
        BitonicMerge(arr, lo, k, direction)
        BitonicMerge(arr, lo + k, k, direction)
    End If
End Sub

Sub BitonicSort(arr As Object, lo As Integer, cnt As Integer, direction As Boolean)
    If cnt > 1 Then
        k = Int(cnt / 2)
        BitonicSort(arr, lo, k, True)
        BitonicSort(arr, lo + k, k, False)
        BitonicMerge(arr, lo, cnt, direction)
    End If
End Sub

Sub Main()
    data = [3, 7, 4, 8, 6, 2, 1, 5]
    BitonicSort(data, 0, data.Count(), True)
    print data
End Sub
