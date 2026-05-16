Imports System

Module TimSortModule
    Const MIN_RUN As Integer = 32

    Sub InsertionSort(arr As Integer(), left As Integer, right As Integer)
        For i As Integer = left + 1 To right
            Dim key As Integer = arr(i)
            Dim j As Integer = i - 1
            While j >= left AndAlso arr(j) > key
                arr(j + 1) = arr(j)
                j -= 1
            End While
            arr(j + 1) = key
        Next
    End Sub

    Sub MergeRuns(arr As Integer(), left As Integer, mid As Integer, right As Integer)
        Dim ln As Integer = mid - left + 1
        Dim rn As Integer = right - mid
        Dim lp(ln - 1) As Integer
        Dim rp(rn - 1) As Integer
        Array.Copy(arr, left, lp, 0, ln)
        Array.Copy(arr, mid + 1, rp, 0, rn)
        Dim i As Integer = 0, j As Integer = 0, k As Integer = left
        While i < ln AndAlso j < rn
            If lp(i) <= rp(j) Then arr(k) = lp(i) : i += 1
            Else arr(k) = rp(j) : j += 1
            End If
            k += 1
        End While
        While i < ln : arr(k) = lp(i) : i += 1 : k += 1 : End While
        While j < rn : arr(k) = rp(j) : j += 1 : k += 1 : End While
    End Sub

    Sub Timsort(arr As Integer())
        Dim n As Integer = arr.Length
        Dim i As Integer = 0
        While i < n
            InsertionSort(arr, i, Math.Min(i + MIN_RUN - 1, n - 1))
            i += MIN_RUN
        End While
        Dim size As Integer = MIN_RUN
        While size < n
            Dim left As Integer = 0
            While left < n
                Dim mid As Integer = Math.Min(left + size - 1, n - 1)
                Dim right As Integer = Math.Min(left + 2 * size - 1, n - 1)
                If mid < right Then MergeRuns(arr, left, mid, right)
                left += 2 * size
            End While
            size *= 2
        End While
    End Sub

    Sub Main()
        Dim arr As Integer() = {5, 2, 8, 1, 9, 3, 7, 4, 6}
        Timsort(arr)
        Console.WriteLine(String.Join(", ", arr))
    End Sub
End Module
