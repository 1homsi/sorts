Function cyclesort:arr[]
  Local n=arr.Length()
  Local pos=0
  While pos<n
    Local item=arr[pos]
    Local cycles=0
    For Local i=0 Until n
      If i<>pos And arr[i]<item
        cycles=cycles+1
      End
    End
    If cycles<>0
      While arr[pos]=item
        pos=pos+1
      End
      Local temp=arr[pos]
      arr[pos]=item
      item=temp
      While cycles>0
        cycles=0
        For Local i=0 Until n
          If i<>pos And arr[i]<item
            cycles=cycles+1
          End
        End
        While arr[pos]=item
          pos=pos+1
        End
        temp=arr[pos]
        arr[pos]=item
        item=temp
        cycles=cycles-1
      End
    End
    pos=pos+1
  End
  Return arr
End

Print cyclesort(New Int[]{5,2,8,1,9,3})
