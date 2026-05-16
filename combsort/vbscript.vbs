Function CombSort(arr)
    Dim n, gap, sorted, i, tmp
    n = UBound(arr) + 1
    gap = n
    sorted = False
    Do While Not sorted
        gap = Int(gap / 1.3)
        If gap < 1 Then gap = 1
        If gap = 1 Then sorted = True
        For i = 0 To n - gap - 1
            If arr(i) > arr(i + gap) Then
                tmp = arr(i)
                arr(i) = arr(i + gap)
                arr(i + gap) = tmp
                sorted = False
            End If
        Next
    Loop
    CombSort = arr
End Function
