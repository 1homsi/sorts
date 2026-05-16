Function QuickSort(arr:Int[])
  If arr.Length <= 1
    Return arr
  End

  Local pivot = arr[0]
  Local less = New IntStack()
  Local greater = New IntStack()

  For i = 1 Until arr.Length
    If arr[i] <= pivot
      less.Push(arr[i])
    Else
      greater.Push(arr[i])
    End
  Next

  Return QuickSort(less.ToArray()) + [pivot] + QuickSort(greater.ToArray())
End

Print(QuickSort([5, 2, 8, 1, 9, 3]))