Global Dim arr(5)
arr(0)=12 : arr(1)=11 : arr(2)=13 : arr(3)=5 : arr(4)=6 : arr(5)=7

Procedure Heapify(n, i)
  Protected largest=i, left=2*i+1, right=2*i+2, tmp
  If left<n And arr(left)>arr(largest) : largest=left : EndIf
  If right<n And arr(right)>arr(largest) : largest=right : EndIf
  If largest<>i
    tmp=arr(i) : arr(i)=arr(largest) : arr(largest)=tmp
    Heapify(n, largest)
  EndIf
EndProcedure

Procedure Heapsort(n)
  Protected i, tmp
  For i=n/2-1 To 0 Step -1 : Heapify(n, i) : Next
  For i=n-1 To 1 Step -1
    tmp=arr(0) : arr(0)=arr(i) : arr(i)=tmp
    Heapify(i, 0)
  Next
EndProcedure

Heapsort(6)
For i=0 To 5
  Print(Str(arr(i))+" ")
Next
PrintN("")
