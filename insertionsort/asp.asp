<%
Function InsertionSort(arr)
    Dim n, i, j, key
    n = UBound(arr) + 1
    For i = 1 To n - 1
        key = arr(i)
        j = i - 1
        Do While j >= 0 And arr(j) > key
            arr(j + 1) = arr(j)
            j = j - 1
        Loop
        arr(j + 1) = key
    Next
    InsertionSort = arr
End Function

Dim arr(4)
arr(0) = 5 : arr(1) = 3 : arr(2) = 1 : arr(3) = 4 : arr(4) = 2
Dim sorted
sorted = InsertionSort(arr)
Dim i
For i = 0 To 4
    Response.Write sorted(i)
    If i < 4 Then Response.Write ", "
Next
%>
