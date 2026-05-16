Dim arr(6)
arr(0) = 64: arr(1) = 34: arr(2) = 25: arr(3) = 12: arr(4) = 22: arr(5) = 11: arr(6) = 90

Sub ShellSort(a)
    Dim n, gap, i, j, temp
    n = UBound(a) + 1
    gap = n \ 2
    Do While gap > 0
        For i = gap To n - 1
            temp = a(i)
            j = i
            Do While j >= gap And a(j - gap) > temp
                a(j) = a(j - gap)
                j = j - gap
            Loop
            a(j) = temp
        Next
        gap = gap \ 2
    Loop
End Sub

ShellSort arr
Dim result
For i = 0 To 6
    result = result & arr(i) & " "
Next
WScript.Echo result
