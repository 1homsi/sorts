Public Module CocktailSort
    Public Sub Sort(ByRef arr As Integer())
        Dim swapped As Boolean = True
        Dim start As Integer = 0
        Dim ending As Integer = arr.Length - 1
        Dim tmp As Integer
        While swapped
            swapped = False
            For i As Integer = start To ending - 1
                If arr(i) > arr(i + 1) Then
                    tmp = arr(i)
                    arr(i) = arr(i + 1)
                    arr(i + 1) = tmp
                    swapped = True
                End If
            Next
            If Not swapped Then Exit While
            swapped = False
            ending -= 1
            For i As Integer = ending - 1 To start Step -1
                If arr(i) > arr(i + 1) Then
                    tmp = arr(i)
                    arr(i) = arr(i + 1)
                    arr(i + 1) = tmp
                    swapped = True
                End If
            Next
            start += 1
        End While
    End Sub
End Module
