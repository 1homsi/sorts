Sub Main()
    arr = [5, 2, 8, 1, 9, 3, 7, 4, 6]
    TimSort(arr)
    print arr
End Sub

Sub InsertionSort(arr As Object, left As Integer, right As Integer)
    For i = left + 1 To right
        key = arr[i]
        j = i - 1
        While j >= left And arr[j] > key
            arr[j + 1] = arr[j]
            j = j - 1
        End While
        arr[j + 1] = key
    Next i
End Sub

Sub MergeRuns(arr As Object, left As Integer, mid As Integer, right As Integer)
    lp = []
    rp = []
    For i = left To mid
        lp.Push(arr[i])
    Next i
    For i = mid + 1 To right
        rp.Push(arr[i])
    Next i
    i = 0 : j = 0 : k = left
    While i < lp.Count() And j < rp.Count()
        If lp[i] <= rp[j] Then
            arr[k] = lp[i] : i = i + 1
        Else
            arr[k] = rp[j] : j = j + 1
        End If
        k = k + 1
    End While
    While i < lp.Count() : arr[k] = lp[i] : i = i + 1 : k = k + 1 : End While
    While j < rp.Count() : arr[k] = rp[j] : j = j + 1 : k = k + 1 : End While
End Sub

Sub TimSort(arr As Object)
    n = arr.Count()
    minRun = 32
    i = 0
    While i < n
        right = i + minRun - 1
        If right >= n Then right = n - 1
        InsertionSort(arr, i, right)
        i = i + minRun
    End While
    size = minRun
    While size < n
        left = 0
        While left < n
            mid = left + size - 1
            If mid >= n Then mid = n - 1
            right = left + 2 * size - 1
            If right >= n Then right = n - 1
            If mid < right Then MergeRuns(arr, left, mid, right)
            left = left + 2 * size
        End While
        size = size * 2
    End While
End Sub
