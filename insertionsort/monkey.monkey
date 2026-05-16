Function InsertionSort:Int[](arr:Int[])
  Local n:Int = arr.Length
  For Local i:Int = 1 Until n
    Local key:Int = arr[i]
    Local j:Int = i - 1
    While j >= 0 And arr[j] > key
      arr[j+1] = arr[j]
      j = j - 1
    Wend
    arr[j+1] = key
  Next
  Return arr
End

Local arr:Int[] = [5, 2, 8, 1, 9, 3]
Print InsertionSort(arr)