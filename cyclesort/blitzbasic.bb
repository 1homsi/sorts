Dim arr(5)
arr(1)=5 : arr(2)=4 : arr(3)=3 : arr(4)=2 : arr(5)=1
n=5 : writes=0

For cs=1 To n-1
    item=arr(cs) : pos=cs
    For i=cs+1 To n
        If arr(i)<item Then pos=pos+1
    Next
    If pos<>cs Then
        While arr(pos)=item : pos=pos+1 : Wend
        tmp=arr(pos) : arr(pos)=item : item=tmp
        writes=writes+1
        While pos<>cs
            pos=cs
            For i=cs+1 To n
                If arr(i)<item Then pos=pos+1
            Next
            While arr(pos)=item : pos=pos+1 : Wend
            tmp=arr(pos) : arr(pos)=item : item=tmp
            writes=writes+1
        Wend
    EndIf
Next

For i=1 To n
    Print arr(i)
Next
End
