arr := [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
n := arr.Length()
sorted := BucketSort(arr, n)
output := ""
Loop % n
    output .= sorted[A_Index] . " "
MsgBox % output

BucketSort(arr, n) {
    If (n = 0)
        Return arr
    minV := arr[1], maxV := arr[1]
    Loop % n {
        If (arr[A_Index] < minV)
            minV := arr[A_Index]
        If (arr[A_Index] > maxV)
            maxV := arr[A_Index]
    }
    buckets := []
    Loop % n
        buckets.Push([])
    Loop % n {
        num := arr[A_Index]
        idx := Floor((num - minV) / (maxV - minV + 1) * n) + 1
        If (idx > n)
            idx := n
        buckets[idx].Push(num)
    }
    result := []
    Loop % n {
        b := buckets[A_Index]
        InsertionSort(b)
        For k, v In b
            result.Push(v)
    }
    Return result
}

InsertionSort(bucket) {
    n := bucket.Length()
    Loop % n - 1 {
        i := A_Index + 1
        key := bucket[i]
        j := i - 1
        While (j >= 1 && bucket[j] > key) {
            bucket[j + 1] := bucket[j]
            j--
        }
        bucket[j + 1] := key
    }
}
