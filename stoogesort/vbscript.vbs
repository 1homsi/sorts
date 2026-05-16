Dim arr(7)
arr(0)=3: arr(1)=1: arr(2)=4: arr(3)=1
arr(4)=5: arr(5)=9: arr(6)=2: arr(7)=6

Sub StoogeSort(first, last)
    If arr(first) > arr(last) Then
        Dim tmp
        tmp = arr(first)
        arr(first) = arr(last)
        arr(last) = tmp
    End If
    Dim n
    n = last - first + 1
    If n > 2 Then
        Dim t
        t = Int(n * 2 / 3)
        StoogeSort first, first + t - 1
        StoogeSort last - t + 1, last
        StoogeSort first, first + t - 1
    End If
End Sub

StoogeSort 0, 7
Dim i
For i = 0 To 7
    WScript.Echo arr(i)
Next
