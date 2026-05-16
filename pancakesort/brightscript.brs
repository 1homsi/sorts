Sub Flip(arr As Object, k As Integer)
    left = 0
    right = k
    While left < right
        tmp = arr[left]
        arr[left] = arr[right]
        arr[right] = tmp
        left = left + 1
        right = right - 1
    End While
End Sub

Function PancakeSort(arr As Object) As Object
    size = arr.Count()
    While size > 1
        maxIdx = 0
        For i = 1 To size - 1
            If arr[i] > arr[maxIdx] Then maxIdx = i
        Next i
        If maxIdx <> size - 1 Then
            If maxIdx <> 0 Then Flip(arr, maxIdx)
            Flip(arr, size - 1)
        End If
        size = size - 1
    End While
    Return arr
End Function

Sub Main()
    arr = CreateObject("roArray", 7, False)
    arr.Push(3) : arr.Push(6) : arr.Push(2) : arr.Push(7)
    arr.Push(4) : arr.Push(1) : arr.Push(5)
    result = PancakeSort(arr)
    print result
End Sub
