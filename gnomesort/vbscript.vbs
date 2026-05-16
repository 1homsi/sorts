Function GnomeSort(arr)
    Dim i, n, tmp
    n = UBound(arr)
    i = 0
    Do While i <= n
        If i = 0 Or arr(i) >= arr(i - 1) Then
            i = i + 1
        Else
            tmp = arr(i)
            arr(i) = arr(i - 1)
            arr(i - 1) = tmp
            i = i - 1
        End If
    Loop
    GnomeSort = arr
End Function
