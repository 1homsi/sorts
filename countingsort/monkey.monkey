Function CountingSort:Int[](arr:Int[])
  If Not arr Return arr

  Local max:Int = 0
  For Local i:Int = 0 Until arr.Length
    If arr[i] > max Then max = arr[i]
  Next

  Local count:Int[max+1]
  For Local i:Int = 0 Until max+1
    count[i] = 0
  Next

  For Local i:Int = 0 Until arr.Length
    count[arr[i]]+=1
  Next

  Local output:Int[arr.Length]
  Local out_idx:Int = 0
  For Local i:Int = 0 Until max+1
    For Local j:Int = 0 Until count[i]
      output[out_idx] = i
      out_idx+=1
    Next
  Next

  Return output
End

Function Main()
  Local arr:Int[] = [5,2,8,1,9,3]
  Print CountingSort(arr)
End
