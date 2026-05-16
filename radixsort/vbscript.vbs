Dim arr(7)
arr(0) = 170 : arr(1) = 45 : arr(2) = 75 : arr(3) = 90
arr(4) = 802 : arr(5) = 24 : arr(6) = 2  : arr(7) = 66

Sub CountingSort(a, exp)
    Dim n, i, idx
    n = 8
    Dim output(7), cnt(9)
    For i = 0 To 9 : cnt(i) = 0 : Next
    For i = 0 To n-1
        idx = (a(i) \ exp) Mod 10
        cnt(idx) = cnt(idx) + 1
    Next
    For i = 1 To 9
        cnt(i) = cnt(i) + cnt(i-1)
    Next
    For i = n-1 To 0 Step -1
        idx = (a(i) \ exp) Mod 10
        cnt(idx) = cnt(idx) - 1
        output(cnt(idx)) = a(i)
    Next
    For i = 0 To n-1 : a(i) = output(i) : Next
End Sub

Dim maxVal, exp
maxVal = arr(0)
For i = 1 To 7
    If arr(i) > maxVal Then maxVal = arr(i)
Next
exp = 1
Do While maxVal \ exp > 0
    CountingSort arr, exp
    exp = exp * 10
Loop

Dim result : result = ""
For i = 0 To 7 : result = result & arr(i) & " " : Next
WScript.Echo result
