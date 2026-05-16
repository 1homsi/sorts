Function bogosort(arr:Int[])
  While Not issorted(arr)
    Shuffle(arr)
  Wend
  Return arr
End

Function issorted(arr:Int[])
  For Local i = 0 Until arr.Length - 1
    If arr[i] > arr[i+1] Then
      Return False
    End
  Next
  Return True
End

Function shuffle(arr:Int[])
  For Local i = 0 Until arr.Length
    Local j = Rnd() Mod arr.Length
    Local tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
  Next
End

Function Main()
  Local arr:Int[] = [3, 1, 2]
  Print bogosort(arr)
End
