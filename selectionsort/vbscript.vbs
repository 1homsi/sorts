Function SelectionSort(arr)
    Dim n, i, j, minIdx, tmp
    n = UBound(arr) + 1
    For i = 0 To n - 2
        minIdx = i
        For j = i + 1 To n - 1
            If arr(j) < arr(minIdx) Then minIdx = j
        Next
        tmp = arr(i): arr(i) = arr(minIdx): arr(minIdx) = tmp
    Next
    SelectionSort = arr
End Function
