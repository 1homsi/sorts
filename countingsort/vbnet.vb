Module CountingSort
    Function Sort(arr As Integer()) As Integer()
        If arr.Length = 0 Then Return arr
        Dim min As Integer = arr(0), max As Integer = arr(0)
        For Each v As Integer In arr
            If v < min Then min = v
            If v > max Then max = v
        Next
        Dim range As Integer = max - min + 1
        Dim count(range - 1) As Integer
        For Each v As Integer In arr: count(v - min) += 1: Next
        For i As Integer = 1 To range - 1: count(i) += count(i - 1): Next
        Dim output(arr.Length - 1) As Integer
        For i As Integer = arr.Length - 1 To 0 Step -1
            count(arr(i) - min) -= 1
            output(count(arr(i) - min)) = arr(i)
        Next
        Return output
    End Function

    Sub Main()
        Dim arr() As Integer = {4, 2, 2, 8, 3, 3, 1}
        Console.WriteLine(String.Join(" ", Sort(arr)))
    End Sub
End Module
