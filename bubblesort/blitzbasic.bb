Dim arr(7)
arr(1)=64 : arr(2)=34 : arr(3)=25 : arr(4)=12
arr(5)=22 : arr(6)=11 : arr(7)=90
n=7
Repeat
    sw=0
    For i=1 To n-1
        If arr(i)>arr(i+1) Then
            t=arr(i) : arr(i)=arr(i+1) : arr(i+1)=t : sw=1
        End If
    Next
    n=n-1
Until sw=0
For i=1 To 7
    Print arr(i)
Next
End
