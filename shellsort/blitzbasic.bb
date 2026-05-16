Dim arr(7)
arr(1)=64 : arr(2)=34 : arr(3)=25 : arr(4)=12
arr(5)=22 : arr(6)=11 : arr(7)=90
n=7
gap=n/2
While gap>0
    For i=gap+1 To n
        temp=arr(i)
        j=i
        While j>gap And arr(j-gap)>temp
            arr(j)=arr(j-gap)
            j=j-gap
        Wend
        arr(j)=temp
    Next
    gap=gap/2
Wend
For i=1 To n
    Print arr(i);" ";
Next
Print
End
