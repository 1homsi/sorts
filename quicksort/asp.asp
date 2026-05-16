<%
Function Partition(arr, low, high)
    Dim pivot, i, j, tmp
    pivot = arr(high)
    i = low
    For j = low To high - 1
        If arr(j) <= pivot Then
            tmp = arr(i)
            arr(i) = arr(j)
            arr(j) = tmp
            i = i + 1
        End If
    Next
    tmp = arr(i)
    arr(i) = arr(high)
    arr(high) = tmp
    Partition = i
End Function

Sub Quicksort(arr, low, high)
    If low < high Then
        Dim p
        p = Partition(arr, low, high)
        Quicksort arr, low, p - 1
        Quicksort arr, p + 1, high
    End If
End Sub

Dim arr(6)
arr(0) = 3 : arr(1) = 6 : arr(2) = 8 : arr(3) = 10
arr(4) = 1 : arr(5) = 2 : arr(6) = 1

Quicksort arr, 0, 6

Dim i
For i = 0 To 6
    Response.Write arr(i) & "<br>"
Next
%>
