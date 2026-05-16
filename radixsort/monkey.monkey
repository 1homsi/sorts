Function radixsort(arr:Int[])
  Local max = 0
  For Local x:Int = Eachin arr
    If x > max Then max = x
  Next
  Local exp = 1
  While max / exp > 0
    arr = countingSortByExp(arr, exp)
    exp = exp * 10
  Wend
  Return arr
End

Function countingSortByExp(arr:Int[], exp)
  Return arr
End

Print radixsort([5, 2, 8, 1, 9, 3])
