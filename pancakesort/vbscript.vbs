Dim arr(6)
arr(0) = 3 : arr(1) = 6 : arr(2) = 2 : arr(3) = 7
arr(4) = 4 : arr(5) = 1 : arr(6) = 5

Sub FlipArr(k)
    Dim left, right, tmp
    left = 0 : right = k
    Do While left < right
        tmp = arr(left)
        arr(left) = arr(right)
        arr(right) = tmp
        left = left + 1
        right = right - 1
    Loop
End Sub

Dim size, maxIdx, i
size = 7
Do While size > 1
    maxIdx = 0
    For i = 1 To size - 1
        If arr(i) > arr(maxIdx) Then maxIdx = i
    Next
    If maxIdx <> size - 1 Then
        If maxIdx <> 0 Then FlipArr maxIdx
        FlipArr size - 1
    End If
    size = size - 1
Loop

Dim result
result = ""
For i = 0 To 6
    result = result & arr(i) & " "
Next
WScript.Echo result
