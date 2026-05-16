Dim arr(5)
arr(1)=5 : arr(2)=3 : arr(3)=1 : arr(4)=4 : arr(5)=2
n=5
For i=1 To n-1
    minIdx=i
    For j=i+1 To n
        If arr(j)<arr(minIdx) Then minIdx=j
    Next
    tmp=arr(i) : arr(i)=arr(minIdx) : arr(minIdx)=tmp
Next
For i=1 To n
    Print arr(i)
Next
