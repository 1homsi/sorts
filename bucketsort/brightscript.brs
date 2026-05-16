function insertionSort(bucket as Object) as Object
    n = bucket.Count()
    for i = 1 to n - 1
        key = bucket[i]
        j = i - 1
        while j >= 0 and bucket[j] > key
            bucket[j + 1] = bucket[j]
            j = j - 1
        end while
        bucket[j + 1] = key
    end for
    return bucket
end function

function bucketSort(arr as Object) as Object
    n = arr.Count()
    if n = 0 then return arr
    minV = arr[0]
    maxV = arr[0]
    for each v in arr
        if v < minV then minV = v
        if v > maxV then maxV = v
    end for
    buckets = []
    for i = 0 to n - 1
        buckets.Push([])
    end for
    for each num in arr
        idx = Int((num - minV) / (maxV - minV + 1) * n)
        if idx >= n then idx = n - 1
        buckets[idx].Push(num)
    end for
    result = []
    for each bucket in buckets
        sorted = insertionSort(bucket)
        for each v in sorted
            result.Push(v)
        end for
    end for
    return result
end function

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
sorted = bucketSort(data)
print sorted
