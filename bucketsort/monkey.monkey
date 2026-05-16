Function bucket_sort(arr:Int[], maxVal:Int)
    Local buckets:List<Int>[] = New List<Int>[maxVal]
    For Local i = 0 Until maxVal
        buckets[i] = New List<Int>
    Next
    For Local num = EachIn arr
        If num >= 0 And num < maxVal
            buckets[num].AddLast(num)
        Endif
    Next
    Local result:Int[] = New Int[arr.Length()]
    Local idx = 0
    For Local i = 0 Until maxVal
        For Local num = EachIn buckets[i]
            result[idx] = num
            idx += 1
        Next
    Next
    Return result
End
Print bucket_sort([5, 2, 8, 1, 9, 3], 10)