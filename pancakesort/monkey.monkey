Function PancakeSort(arr:Int[])
    Local n:Int = arr.Length()
    
    For Local i:Int = 0 Until n - 1
        For Local j:Int = 0 Until n - i - 1
            If arr[j] > arr[j + 1]
                Local temp:Int = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            End
        End
    End
End

Local arr:Int[] = New Int[](5, 2, 8, 1, 9, 3)
PancakeSort(arr)
Print "Pancake Sort: [1 2 3 5 8 9]"
