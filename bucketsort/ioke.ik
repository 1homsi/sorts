insertionSort = method(bucket,
    n = bucket length
    1 to(n - 1) do(i,
        key = bucket at(i)
        j = i - 1
        while(j >= 0 && bucket at(j) > key,
            bucket at(j + 1) = bucket at(j)
            j = j - 1
        )
        bucket at(j + 1) = key
    )
    bucket
)

bucketSort = method(arr,
    n = arr length
    if(n == 0, return(arr))
    minV = arr min
    maxV = arr max
    buckets = n times map([], list())
    arr each(num,
        idx = ((num - minV) / (maxV - minV + 1) * n) floor
        if(idx >= n, idx = n - 1)
        buckets at(idx) << num
    )
    result = list()
    buckets each(b,
        insertionSort(b) each(v, result << v)
    )
    result
)

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
bucketSort(data) println
