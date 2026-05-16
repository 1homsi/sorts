Dim arr(5)
arr(0) = 12 : arr(1) = 11 : arr(2) = 13 : arr(3) = 5 : arr(4) = 6 : arr(5) = 7

Sub Heapify(a, n, i)
    Dim largest, left, right, tmp
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2
    If left < n And a(left) > a(largest) Then largest = left
    If right < n And a(right) > a(largest) Then largest = right
    If largest <> i Then
        tmp = a(i) : a(i) = a(largest) : a(largest) = tmp
        Heapify a, n, largest
    End If
End Sub

Sub Heapsort(a, n)
    Dim i, tmp
    For i = Int(n/2) - 1 To 0 Step -1
        Heapify a, n, i
    Next
    For i = n - 1 To 1 Step -1
        tmp = a(0) : a(0) = a(i) : a(i) = tmp
        Heapify a, i, 0
    Next
End Sub

Heapsort arr, 6
Dim i
For i = 0 To 5
    WScript.Echo arr(i)
Next
