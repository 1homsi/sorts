BucketSort := Object clone do(
    insertionSort := method(bucket,
        n := bucket size
        1 to(n - 1) do(i,
            key := bucket at(i)
            j := i - 1
            while(j >= 0 and(bucket at(j) > key),
                bucket atPut(j + 1, bucket at(j))
                j = j - 1
            )
            bucket atPut(j + 1, key)
        )
        bucket
    )

    sort := method(arr,
        n := arr size
        if(n == 0, return arr)
        minV := arr min
        maxV := arr max
        buckets := List clone
        n times(buckets append(List clone))
        arr foreach(num,
            idx := ((num - minV) / (maxV - minV + 1) * n) floor
            if(idx >= n, idx = n - 1)
            (buckets at(idx)) append(num)
        )
        result := List clone
        buckets foreach(bucket,
            insertionSort(bucket) foreach(v, result append(v))
        )
        result
    )
)

data := list(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)
BucketSort sort(data) println
