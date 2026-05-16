Function CocktailSort(arr[], n)
    Local swapped, start, ending, i, tmp
    swapped = 1
    start = 0
    ending = n - 1
    While swapped
        swapped = 0
        For i = start To ending - 1
            If arr[i] > arr[i + 1] Then
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = 1
            EndIf
        Next
        If swapped = 0 Then Return
        swapped = 0
        ending = ending - 1
        For i = ending - 1 To start Step -1
            If arr[i] > arr[i + 1] Then
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = 1
            EndIf
        Next
        start = start + 1
    Wend
End Function
