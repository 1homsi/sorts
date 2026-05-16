Function gnomesort:Int[](arr:Int[])
  Local i:Int = 0
  While i < arr.Length
    If i = 0 Then
      i += 1
    Else If arr[i] < arr[i - 1] Then
      Local temp:Int = arr[i]
      arr[i] = arr[i - 1]
      arr[i - 1] = temp
      i -= 1
    Else
      i += 1
    Endif
  Wend
  Return arr
End

Function Main()
  Local test:Int[] = [5, 2, 8, 1, 9, 3]
  Print gnomesort(test)
End
