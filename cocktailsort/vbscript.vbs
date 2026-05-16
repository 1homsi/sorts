Function CocktailSort(arr)
    Dim swapped, start, ending, i, tmp
    swapped = True
    start = 0
    ending = UBound(arr)
    Do While swapped
        swapped = False
        For i = start To ending - 1
            If arr(i) > arr(i + 1) Then
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = True
            End If
        Next
        If Not swapped Then Exit Do
        swapped = False
        ending = ending - 1
        For i = ending - 1 To start Step -1
            If arr(i) > arr(i + 1) Then
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = True
            End If
        Next
        start = start + 1
    Loop
    CocktailSort = arr
End Function
