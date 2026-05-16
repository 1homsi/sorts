Module ShellSort
    Sub ShellSortArr(ByRef arr() As Integer)
        Dim n As Integer = arr.Length
        Dim gap As Integer = n \ 2
        Do While gap > 0
            For i As Integer = gap To n - 1
                Dim temp As Integer = arr(i)
                Dim j As Integer = i
                Do While j >= gap AndAlso arr(j - gap) > temp
                    arr(j) = arr(j - gap)
                    j -= gap
                Loop
                arr(j) = temp
            Next
            gap = gap \ 2
        Loop
    End Sub

    Sub Main()
        Dim arr() As Integer = {64, 34, 25, 12, 22, 11, 90}
        ShellSortArr(arr)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
