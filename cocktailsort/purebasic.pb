Procedure CocktailSort(Array arr(1), n)
    swapped = #True
    start = 0
    ending = n - 1
    While swapped
        swapped = #False
        For i = start To ending - 1
            If arr(i) > arr(i + 1)
                Swap arr(i), arr(i + 1)
                swapped = #True
            EndIf
        Next i
        If Not swapped : Break : EndIf
        swapped = #False
        ending - 1
        For i = ending - 1 To start Step -1
            If arr(i) > arr(i + 1)
                Swap arr(i), arr(i + 1)
                swapped = #True
            EndIf
        Next i
        start + 1
    Wend
EndProcedure
