Dim arr(7)
arr(0) = 3 : arr(1) = 1 : arr(2) = 4 : arr(3) = 1
arr(4) = 5 : arr(5) = 9 : arr(6) = 2 : arr(7) = 6

Function IsSorted()
    Dim i
    IsSorted = True
    For i = 0 To 6
        If arr(i) > arr(i + 1) Then
            IsSorted = False
            Exit Function
        End If
    Next
End Function

Sub Shuffle()
    Dim i, j, tmp
    For i = 7 To 1 Step -1
        j = Int(Rnd() * (i + 1))
        tmp = arr(i)
        arr(i) = arr(j)
        arr(j) = tmp
    Next
End Sub

Randomize
Do While Not IsSorted()
    Shuffle()
Loop

Dim result
For i = 0 To 7
    result = result & arr(i) & " "
Next
WScript.Echo result
