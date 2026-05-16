Module RadixSort
    Sub CountingSort(ByRef arr() As Integer, exp As Integer)
        Dim n As Integer = arr.Length
        Dim output(n - 1) As Integer
        Dim count(9) As Integer
        For i = 0 To n - 1
            count((arr(i) \ exp) Mod 10) += 1
        Next
        For i = 1 To 9
            count(i) += count(i - 1)
        Next
        For i = n - 1 To 0 Step -1
            Dim idx = (arr(i) \ exp) Mod 10
            count(idx) -= 1
            output(count(idx)) = arr(i)
        Next
        Array.Copy(output, arr, n)
    End Sub

    Sub RadixSortArr(ByRef arr() As Integer)
        If arr.Length = 0 Then Return
        Dim max = arr.Max()
        Dim exp = 1
        While max \ exp > 0
            CountingSort(arr, exp)
            exp *= 10
        End While
    End Sub

    Sub Main()
        Dim arr() As Integer = {170, 45, 75, 90, 802, 24, 2, 66}
        RadixSortArr(arr)
        Console.WriteLine(String.Join(", ", arr))
    End Sub
End Module
