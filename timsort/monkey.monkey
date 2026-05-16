Function timsort(arr, minSize)
  Return mergesort(arr, minSize)
End Function

Function mergesort(arr, minSize)
  If arr.Length <= 1
    Return arr
  End If
  If arr.Length <= minSize
    Return insertionsort(arr)
  End If
  
  Local mid = arr.Length / 2
  Local left = arr.Slice(0, mid)
  Local right = arr.Slice(mid)
  
  Return merge(mergesort(left, minSize), mergesort(right, minSize))
End Function

Function insertionsort(arr)
  Local result = arr.Slice()
  For Local i = 1 To result.Length - 1
    Local key = result[i]
    Local j = i - 1
    While j >= 0 And result[j] > key
      result[j + 1] = result[j]
      j = j - 1
    Wend
    result[j + 1] = key
  Next
  Return result
End Function

Function merge(left, right)
  Local result = New Int[left.Length + right.Length]
  Local i = 0, j = 0, k = 0
  
  While i < left.Length And j < right.Length
    If left[i] <= right[j]
      result[k] = left[i]
      i = i + 1
    Else
      result[k] = right[j]
      j = j + 1
    End If
    k = k + 1
  Wend
  
  While i < left.Length
    result[k] = left[i]
    i = i + 1
    k = k + 1
  Wend
  While j < right.Length
    result[k] = right[j]
    j = j + 1
    k = k + 1
  Wend
  
  Return result
End Function

Local arr = [5, 2, 8, 1, 9, 3]
Print timsort(arr, 32)
