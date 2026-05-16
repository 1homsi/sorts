Function BubbleSort:Int[](arr:Int[])
  Local n:Int = arr.Length()
  For Local i:Int = 0 Until n
    For Local j:Int = 0 Until n - 1 - i
      If arr[j] > arr[j + 1]
        Local temp:Int = arr[j]
        arr[j] = arr[j + 1]
        arr[j + 1] = temp
      EndIf
    Next
  Next
  Return arr
End

Local result:Int[] = BubbleSort([5, 2, 8, 1, 9, 3])
Print(result)