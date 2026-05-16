Function MergeArrays(left, right)
    Dim result()
    Dim i, j, k
    i = 0 : j = 0 : k = 0
    ReDim result(UBound(left) + UBound(right) + 1)
    Do While i <= UBound(left) And j <= UBound(right)
        If left(i) <= right(j) Then
            result(k) = left(i) : i = i + 1
        Else
            result(k) = right(j) : j = j + 1
        End If
        k = k + 1
    Loop
    Do While i <= UBound(left)
        result(k) = left(i) : i = i + 1 : k = k + 1
    Loop
    Do While j <= UBound(right)
        result(k) = right(j) : j = j + 1 : k = k + 1
    Loop
    ReDim Preserve result(k - 1)
    MergeArrays = result
End Function

Function MergeSort(arr)
    Dim n, mid, left(), right(), i
    n = UBound(arr) + 1
    If n <= 1 Then
        MergeSort = arr
        Exit Function
    End If
    mid = n \ 2
    ReDim left(mid - 1)
    ReDim right(n - mid - 1)
    For i = 0 To mid - 1 : left(i) = arr(i) : Next
    For i = 0 To n - mid - 1 : right(i) = arr(mid + i) : Next
    MergeSort = MergeArrays(MergeSort(left), MergeSort(right))
End Function

Dim arr(6)
arr(0)=38 : arr(1)=27 : arr(2)=43 : arr(3)=3 : arr(4)=9 : arr(5)=82 : arr(6)=10
Dim sorted
sorted = MergeSort(arr)
Dim i
For i = 0 To UBound(sorted)
    WScript.Echo sorted(i)
Next
