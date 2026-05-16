func insertionSort bucket
    n = len(bucket)
    for i = 2 to n
        key = bucket[i]
        j = i - 1
        while j >= 1 and bucket[j] > key
            bucket[j + 1] = bucket[j]
            j -= 1
        end
        bucket[j + 1] = key
    next
    return bucket

func bucketSort arr
    n = len(arr)
    if n = 0 return arr ok
    minV = arr[1]
    maxV = arr[1]
    for v in arr
        if v < minV minV = v ok
        if v > maxV maxV = v ok
    next
    buckets = list(n)
    for i = 1 to n
        buckets[i] = []
    next
    for num in arr
        idx = floor((num - minV) / (maxV - minV + 1) * n) + 1
        if idx > n idx = n ok
        add(buckets[idx], num)
    next
    result = []
    for b in buckets
        sorted = insertionSort(b)
        for v in sorted
            add(result, v)
        next
    next
    return result

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
? bucketSort(data)
