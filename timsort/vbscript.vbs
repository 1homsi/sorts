Const MIN_RUN = 32

Sub InsertionSort(arr, left, right)
    Dim i, j, key
    For i = left + 1 To right
        key = arr(i)
        j = i - 1
        Do While j >= left And arr(j) > key
            arr(j + 1) = arr(j)
            j = j - 1
        Loop
        arr(j + 1) = key
    Next
End Sub

Sub MergeRuns(arr, left, mid, right)
    Dim ln, rn, i, j, k
    ln = mid - left + 1
    rn = right - mid
    Dim lp(), rp()
    ReDim lp(ln - 1)
    ReDim rp(rn - 1)
    For i = 0 To ln - 1: lp(i) = arr(left + i): Next
    For i = 0 To rn - 1: rp(i) = arr(mid + 1 + i): Next
    i = 0: j = 0: k = left
    Do While i < ln And j < rn
        If lp(i) <= rp(j) Then
            arr(k) = lp(i): i = i + 1
        Else
            arr(k) = rp(j): j = j + 1
        End If
        k = k + 1
    Loop
    Do While i < ln: arr(k) = lp(i): i = i + 1: k = k + 1: Loop
    Do While j < rn: arr(k) = rp(j): j = j + 1: k = k + 1: Loop
End Sub

Sub Timsort(arr, n)
    Dim i, size, left, mid, right
    i = 0
    Do While i < n
        right = i + MIN_RUN - 1
        If right >= n Then right = n - 1
        InsertionSort arr, i, right
        i = i + MIN_RUN
    Loop
    size = MIN_RUN
    Do While size < n
        left = 0
        Do While left < n
            mid = left + size - 1
            If mid >= n Then mid = n - 1
            right = left + 2 * size - 1
            If right >= n Then right = n - 1
            If mid < right Then MergeRuns arr, left, mid, right
            left = left + 2 * size
        Loop
        size = size * 2
    Loop
End Sub

Dim arr(8)
arr(0)=5: arr(1)=2: arr(2)=8: arr(3)=1: arr(4)=9
arr(5)=3: arr(6)=7: arr(7)=4: arr(8)=6
Timsort arr, 9
Dim out, i
For i = 0 To 8: out = out & arr(i) & " ": Next
WScript.Echo out
