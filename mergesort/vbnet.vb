Module MergeSort
    Function Merge(left As Integer(), right As Integer()) As Integer()
        Dim result As New List(Of Integer)
        Dim i As Integer = 0, j As Integer = 0
        While i < left.Length AndAlso j < right.Length
            If left(i) <= right(j) Then
                result.Add(left(i)) : i += 1
            Else
                result.Add(right(j)) : j += 1
            End If
        End While
        While i < left.Length : result.Add(left(i)) : i += 1 : End While
        While j < right.Length : result.Add(right(j)) : j += 1 : End While
        Return result.ToArray()
    End Function

    Function MergeSort(arr As Integer()) As Integer()
        If arr.Length <= 1 Then Return arr
        Dim mid As Integer = arr.Length \ 2
        Dim left = MergeSort(arr.Take(mid).ToArray())
        Dim right = MergeSort(arr.Skip(mid).ToArray())
        Return Merge(left, right)
    End Function

    Sub Main()
        Dim arr As Integer() = {38, 27, 43, 3, 9, 82, 10}
        Dim sorted = MergeSort(arr)
        Console.WriteLine(String.Join(", ", sorted))
    End Sub
End Module
