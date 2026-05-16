Dim arr(5)
arr(0)=12 : arr(1)=11 : arr(2)=13 : arr(3)=5 : arr(4)=6 : arr(5)=7
n=6

For i = n/2-1 To 0 Step -1
    heapify(n, i)
Next

For i = n-1 To 1 Step -1
    tmp=arr(0) : arr(0)=arr(i) : arr(i)=tmp
    heapify(i, 0)
Next

For i=0 To n-1
    Print arr(i)
Next

Function heapify(pn, pi)
    largest=pi
    left=2*pi+1
    right=2*pi+2
    If left<pn And arr(left)>arr(largest) Then largest=left
    If right<pn And arr(right)>arr(largest) Then largest=right
    If largest<>pi Then
        tmp=arr(pi) : arr(pi)=arr(largest) : arr(largest)=tmp
        heapify(pn, largest)
    EndIf
End Function
