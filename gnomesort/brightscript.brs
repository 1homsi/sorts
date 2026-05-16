Function GnomeSort(arr As Object) As Object
    n = arr.Count()
    i = 0
    While i < n
        If i = 0 Or arr[i] >= arr[i - 1] Then
            i = i + 1
        Else
            tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i = i - 1
        End If
    End While
    Return arr
End Function
