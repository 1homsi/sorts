Function CycleSort(arr As Object) As Object
    n = arr.Count()
    writes = 0
    For cycleStart = 0 To n - 2
        item = arr[cycleStart]
        pos = cycleStart
        For i = cycleStart + 1 To n - 1
            If arr[i] < item Then pos = pos + 1
        End For
        If pos <> cycleStart Then
            While arr[pos] = item
                pos = pos + 1
            End While
            tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes = writes + 1
            While pos <> cycleStart
                pos = cycleStart
                For i = cycleStart + 1 To n - 1
                    If arr[i] < item Then pos = pos + 1
                End For
                While arr[pos] = item
                    pos = pos + 1
                End While
                tmp = arr[pos]
                arr[pos] = item
                item = tmp
                writes = writes + 1
            End While
        End If
    End For
    Return arr
End Function

arr = [5, 4, 3, 2, 1]
sorted = CycleSort(arr)
print sorted
