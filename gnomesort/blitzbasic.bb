Dim arr(10)
arr(0)=5: arr(1)=3: arr(2)=8: arr(3)=1: arr(4)=9
arr(5)=2: arr(6)=7: arr(7)=4: arr(8)=6: arr(9)=0
n = 10: i = 0
While i < n
    If i = 0 Or arr(i) >= arr(i-1) Then
        i = i + 1
    Else
        t = arr(i): arr(i) = arr(i-1): arr(i-1) = t
        i = i - 1
    End If
Wend
For k = 0 To n-1: Print arr(k): Next
