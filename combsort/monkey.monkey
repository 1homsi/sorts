Function CombSort(arr:Int[])
  Local gap := arr.Length
  Local swapped := True
  While gap > 1 Or swapped
    gap = (gap * 10) / 13
    If gap < 1 Then gap = 1
    swapped = False
    For Local i = 0 Until arr.Length - gap
      If arr[i] > arr[i + gap] Then
        Local temp := arr[i]
        arr[i] = arr[i + gap]
        arr[i + gap] = temp
        swapped = True
      End
    End
  End
  Return arr
End

Function Main()
  Local sample := New Int[](5, 2, 8, 1, 9, 3)
  CombSort(sample)
  For Local x := Each sample
    Print x
  End
End
