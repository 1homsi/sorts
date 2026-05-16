Function CountingSort(arr As Object, exp As Integer) As Object
    n = arr.Count()
    output = CreateObject("roArray", n, false)
    For i = 0 To n - 1
        output.Push(0)
    End For
    count = CreateObject("roArray", 10, false)
    For i = 0 To 9
        count.Push(0)
    End For
    For i = 0 To n - 1
        idx = Int(arr[i] / exp) Mod 10
        count[idx] = count[idx] + 1
    End For
    For i = 1 To 9
        count[i] = count[i] + count[i - 1]
    End For
    For i = n - 1 To 0 Step -1
        idx = Int(arr[i] / exp) Mod 10
        count[idx] = count[idx] - 1
        output[count[idx]] = arr[i]
    End For
    Return output
End Function

Function RadixSort(arr As Object) As Object
    If arr.Count() = 0 Then Return arr
    maxVal = arr[0]
    For Each x In arr
        If x > maxVal Then maxVal = x
    End For
    exp = 1
    While Int(maxVal / exp) > 0
        arr = CountingSort(arr, exp)
        exp = exp * 10
    End While
    Return arr
End Function

arr = [170, 45, 75, 90, 802, 24, 2, 66]
result = RadixSort(arr)
For Each x In result
    Print x; " ";
End For
Print ""
