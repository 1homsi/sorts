Module CycleSort
    Function CycleSort(ByRef arr() As Integer) As Integer
        Dim writes As Integer = 0
        Dim n As Integer = arr.Length
        For cycleStart As Integer = 0 To n - 2
            Dim item As Integer = arr(cycleStart)
            Dim pos As Integer = cycleStart
            For i As Integer = cycleStart + 1 To n - 1
                If arr(i) < item Then pos += 1
            Next
            If pos = cycleStart Then Continue For
            While item = arr(pos) : pos += 1 : End While
            Dim tmp As Integer = arr(pos) : arr(pos) = item : item = tmp
            writes += 1
            While pos <> cycleStart
                pos = cycleStart
                For i As Integer = cycleStart + 1 To n - 1
                    If arr(i) < item Then pos += 1
                Next
                While item = arr(pos) : pos += 1 : End While
                tmp = arr(pos) : arr(pos) = item : item = tmp
                writes += 1
            End While
        Next
        Return writes
    End Function

    Sub Main()
        Dim arr() As Integer = {5, 4, 3, 2, 1}
        CycleSort(arr)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
