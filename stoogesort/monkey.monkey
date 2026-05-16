Function stoogesort(a:Int[], i:Int, j:Int)
  If a[j] < a[i]
    Local temp:Int = a[j]
    a[j] = a[i]
    a[i] = temp
  Endif
  If j - i > 1
    Local t:Int = (j - i + 1) / 3
    stoogesort(a, i, j - t)
    stoogesort(a, i + t, j)
    stoogesort(a, i, j - t)
  Endif
End

Local arr:Int[] = [5, 2, 8, 1, 9, 3]
stoogesort(arr, 0, 5)
Print(arr)
