Function CountingSort(arr)
    Dim n, i, minVal, maxVal, rng, idx, pos
    n = UBound(arr) + 1
    If n = 0 Then
        CountingSort = arr
        Exit Function
    End If
    minVal = arr(0): maxVal = arr(0)
    For i = 1 To n - 1
        If arr(i) < minVal Then minVal = arr(i)
        If arr(i) > maxVal Then maxVal = arr(i)
    Next
    rng = maxVal - minVal + 1
    Dim count(): ReDim count(rng - 1)
    For i = 0 To rng - 1: count(i) = 0: Next
    For i = 0 To n - 1: count(arr(i) - minVal) = count(arr(i) - minVal) + 1: Next
    For i = 1 To rng - 1: count(i) = count(i) + count(i - 1): Next
    Dim output(): ReDim output(n - 1)
    For i = n - 1 To 0 Step -1
        count(arr(i) - minVal) = count(arr(i) - minVal) - 1
        output(count(arr(i) - minVal)) = arr(i)
    Next
    CountingSort = output
End Function

Dim arr(6)
arr(0) = 4: arr(1) = 2: arr(2) = 2: arr(3) = 8
arr(4) = 3: arr(5) = 3: arr(6) = 1
Dim result: result = CountingSort(arr)
Dim i
For i = 0 To 6: WScript.Echo result(i): Next
