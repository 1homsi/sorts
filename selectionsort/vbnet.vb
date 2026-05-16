Module SelectionSort
    Function Sort(arr As Integer()) As Integer()
        Dim n As Integer = arr.Length
        For i As Integer = 0 To n - 2
            Dim minIdx As Integer = i
            For j As Integer = i + 1 To n - 1
                If arr(j) < arr(minIdx) Then minIdx = j
            Next
            Dim tmp As Integer = arr(i)
            arr(i) = arr(minIdx)
            arr(minIdx) = tmp
        Next
        Return arr
    End Function
End Module
