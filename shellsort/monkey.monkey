Function shellsort:arr
  Local gap, n, i, j, temp
  n = arr.Length()
  gap = 1
  While gap <= n
    gap = gap * 3 + 1
  Wend
  While gap > 0
    gap = gap / 3
    For i = gap Until n
      temp = arr.Get(i)
      j = i
      While j >= gap And arr.Get(j - gap) > temp
        arr.Set(j, arr.Get(j - gap))
        j = j - gap
      Wend
      arr.Set(j, temp)
    Next i
  Wend
  Return arr
End
