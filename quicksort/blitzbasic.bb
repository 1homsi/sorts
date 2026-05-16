Dim arr(6)
arr(0)=3 : arr(1)=6 : arr(2)=8 : arr(3)=10
arr(4)=1 : arr(5)=2 : arr(6)=1

Function Partition(low, high)
    pivot = arr(high)
    i = low
    For j = low To high - 1
        If arr(j) <= pivot Then
            tmp = arr(i) : arr(i) = arr(j) : arr(j) = tmp
            i = i + 1
        End If
    Next
    tmp = arr(i) : arr(i) = arr(high) : arr(high) = tmp
    Return i
End Function

Function QuickSort(low, high)
    If low < high Then
        p = Partition(low, high)
        QuickSort(low, p - 1)
        QuickSort(p + 1, high)
    End If
End Function

QuickSort(0, 6)
For i = 0 To 6 : Print arr(i) : Next
