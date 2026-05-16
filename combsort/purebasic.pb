Procedure CombSort(Array arr.i(1), n)
    Protected gap.i = n
    Protected sorted.b = #False
    Protected tmp.i
    Repeat
        gap = Int(gap / 1.3)
        If gap < 1 : gap = 1 : EndIf
        If gap = 1 : sorted = #True : EndIf
        Protected i
        For i = 0 To n - gap - 1
            If arr(i) > arr(i + gap)
                tmp = arr(i)
                arr(i) = arr(i + gap)
                arr(i + gap) = tmp
                sorted = #False
            EndIf
        Next
    Until sorted
EndProcedure
