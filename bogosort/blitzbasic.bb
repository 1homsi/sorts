Dim arr(8)
arr(1)=3 : arr(2)=1 : arr(3)=4 : arr(4)=1
arr(5)=5 : arr(6)=9 : arr(7)=2 : arr(8)=6
n=8

SeedRnd MilliSecs()

Repeat
  sorted=True
  For i=1 To n-1
    If arr(i)>arr(i+1) Then sorted=False
  Next
  If Not sorted Then
    For i=n To 2 Step -1
      j=Rnd(i-1)+1
      tmp=arr(i) : arr(i)=arr(j) : arr(j)=tmp
    Next
  End If
Until sorted

For i=1 To n
  Write arr(i)+" "
Next
Print ""
