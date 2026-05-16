Public Module CombSort
    Public Sub Sort(ByRef arr() As Integer)
        Dim n As Integer = arr.Length
        Dim gap As Integer = n
        Dim sorted As Boolean = False
        Dim tmp As Integer
        While Not sorted
            gap = CInt(gap / 1.3)
            If gap <= 1 Then
                gap = 1
                sorted = True
            End If
            For i As Integer = 0 To n - gap - 1
                If arr(i) > arr(i + gap) Then
                    tmp = arr(i)
                    arr(i) = arr(i + gap)
                    arr(i + gap) = tmp
                    sorted = False
                End If
            Next
        End While
    End Sub
End Module
