Module GnomeSort
    Sub Sort(arr As Integer())
        Dim i As Integer = 0
        Dim n As Integer = arr.Length
        While i < n
            If i = 0 OrElse arr(i) >= arr(i - 1) Then
                i += 1
            Else
                Dim tmp As Integer = arr(i)
                arr(i) = arr(i - 1)
                arr(i - 1) = tmp
                i -= 1
            End If
        End While
    End Sub
End Module
