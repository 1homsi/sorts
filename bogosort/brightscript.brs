Function IsSorted(arr As Object) As Boolean
    n = arr.Count()
    For i = 0 To n - 2
        If arr[i] > arr[i + 1] Then Return False
    Next i
    Return True
End Function

Sub Shuffle(arr As Object)
    n = arr.Count()
    For i = n - 1 To 1 Step -1
        j = Int(Rnd(0) * (i + 1))
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    Next i
End Sub

Sub Bogosort(arr As Object)
    While Not IsSorted(arr)
        Shuffle(arr)
    End While
End Sub

Sub Main()
    arr = CreateObject("roArray", 8, False)
    arr.Push(3) : arr.Push(1) : arr.Push(4) : arr.Push(1)
    arr.Push(5) : arr.Push(9) : arr.Push(2) : arr.Push(6)
    Bogosort(arr)
    For Each v In arr
        Print v; " ";
    Next
    Print ""
End Sub
