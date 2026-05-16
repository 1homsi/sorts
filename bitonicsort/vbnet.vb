Module BitonicSort
    Dim arr() As Integer = {3, 7, 4, 8, 6, 2, 1, 5}

    Sub CompareAndSwap(i As Integer, j As Integer, direction As Boolean)
        If direction = (arr(i) > arr(j)) Then
            Dim tmp As Integer = arr(i)
            arr(i) = arr(j)
            arr(j) = tmp
        End If
    End Sub

    Sub BitonicMerge(lo As Integer, cnt As Integer, direction As Boolean)
        If cnt > 1 Then
            Dim k As Integer = cnt \ 2
            For idx As Integer = lo To lo + k - 1
                CompareAndSwap(idx, idx + k, direction)
            Next
            BitonicMerge(lo, k, direction)
            BitonicMerge(lo + k, k, direction)
        End If
    End Sub

    Sub BitonicSort(lo As Integer, cnt As Integer, direction As Boolean)
        If cnt > 1 Then
            Dim k As Integer = cnt \ 2
            BitonicSort(lo, k, True)
            BitonicSort(lo + k, k, False)
            BitonicMerge(lo, cnt, direction)
        End If
    End Sub

    Sub Main()
        BitonicSort(0, arr.Length, True)
        Console.WriteLine(String.Join(" ", arr))
    End Sub
End Module
