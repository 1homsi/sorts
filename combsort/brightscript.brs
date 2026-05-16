Function CombSort(arr As Object) As Object
    n = arr.Count()
    gap = n
    sorted = False
    While Not sorted
        gap = Int(gap / 1.3)
        If gap <= 1 Then
            gap = 1
            sorted = True
        End If
        For i = 0 To n - gap - 1
            If arr[i] > arr[i + gap] Then
                tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = False
            End If
        Next i
    End While
    Return arr
End Function
