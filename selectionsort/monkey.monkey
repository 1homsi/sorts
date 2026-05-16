Function SelectionSort:arr[]
    Local n:=arr.Length()
    For Local i:=0 Until n-1
        Local minIdx:=i
        For Local j:=i+1 Until n
            If arr[j]<arr[minIdx]
                minIdx=j
            End
        End
        Local tmp:=arr[i]
        arr[i]=arr[minIdx]
        arr[minIdx]=tmp
    End
    Return arr
End

Print(SelectionSort([5,2,8,1,9,3]))