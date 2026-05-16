Function cocktailsort:arr:array
    Local n:=arr.Length()
    Local i:=0
    While i < n
        Local swapped:=False
        For Local k:=0 Until k < n-i-1
            If arr[k] > arr[k+1]
                Local temp:=arr[k]
                arr[k] = arr[k+1]
                arr[k+1] = temp
                swapped = True
            End
        End
        If Not swapped Then Return arr
        i += 1
        swapped = False
        For Local k:=n-i-2 Until k >= 0 Step -1
            If arr[k] > arr[k+1]
                Local temp:=arr[k]
                arr[k] = arr[k+1]
                arr[k+1] = temp
                swapped = True
            End
        End
        If Not swapped Then Return arr
        i += 1
    Wend
    Return arr
End

Function Main()
    Local arr:=[5,2,8,1,9,3]
    Print cocktailsort(arr)
End
