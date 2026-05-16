Function Merge:void(arr:Int[], left:Int, mid:Int, right:Int)
  Local i:Int = left
  Local j:Int = mid + 1
  Local result:Int[] = New Int[right - left + 1]
  Local k:Int = 0
  
  While i <= mid And j <= right
    If arr[i] <= arr[j]
      result[k] = arr[i]
      i += 1
    Else
      result[k] = arr[j]
      j += 1
    End
    k += 1
  Wend
  
  While i <= mid
    result[k] = arr[i]
    i += 1
    k += 1
  Wend
  
  While j <= right
    result[k] = arr[j]
    j += 1
    k += 1
  Wend
  
  For k = 0 Until result.Length
    arr[left + k] = result[k]
  Next
End

Function MergeSort:void(arr:Int[], left:Int, right:Int)
  If left < right
    Local mid:Int = (left + right) / 2
    MergeSort arr, left, mid
    MergeSort arr, mid + 1, right
    Merge arr, left, mid, right
  End
End

Function Main:Int()
  Local arr:Int[] = New Int[](5, 2, 8, 1, 9, 3)
  MergeSort arr, 0, 5
  Print arr
  Return 0
End
