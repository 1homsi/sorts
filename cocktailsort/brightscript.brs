Function CocktailSort(arr As Object) As Object
    swapped = True
    start = 0
    ending = arr.Count() - 1
    While swapped
        swapped = False
        For i = start To ending - 1
            If arr[i] > arr[i + 1] Then
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = True
            End If
        Next i
        If Not swapped Then Exit While
        swapped = False
        ending = ending - 1
        For i = ending - 1 To start Step -1
            If arr[i] > arr[i + 1] Then
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = True
            End If
        Next i
        start = start + 1
    End While
    Return arr
End Function
