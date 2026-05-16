Function ShellSort(arr As Object) As Object
    n = arr.Count()
    gap = Int(n / 2)
    While gap > 0
        For i = gap To n - 1
            temp = arr[i]
            j = i
            While j >= gap And arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j = j - gap
            End While
            arr[j] = temp
        Next i
        gap = Int(gap / 2)
    End While
    Return arr
End Function

Sub Main()
    arr = [64, 34, 25, 12, 22, 11, 90]
    sorted = ShellSort(arr)
    For Each v In sorted
        print v; " ";
    Next
    print ""
End Sub
