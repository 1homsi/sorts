Dim arr(6)
arr(0)=3 : arr(1)=6 : arr(2)=2 : arr(3)=7
arr(4)=4 : arr(5)=1 : arr(6)=5

Function Flip(k)
    left=0 : right=k
    While left < right
        tmp=arr(left) : arr(left)=arr(right) : arr(right)=tmp
        left=left+1 : right=right-1
    Wend
End Function

Function FindMaxIdx(size)
    maxIdx=0
    For i=1 To size-1
        If arr(i) > arr(maxIdx) Then maxIdx=i
    Next
    Return maxIdx
End Function

size=7
While size > 1
    maxIdx=FindMaxIdx(size)
    If maxIdx <> size-1
        If maxIdx <> 0 Then Flip(maxIdx)
        Flip(size-1)
    EndIf
    size=size-1
Wend

For i=0 To 6 : Print arr(i) : Next
