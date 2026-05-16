import System.Collections.Generic

def insertion_sort(bucket as List[of double]):
    n = bucket.Count
    for i in range(1, n):
        key = bucket[i]
        j = i - 1
        while j >= 0 and bucket[j] > key:
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key
    return bucket

def bucket_sort(arr as List[of double]):
    n = arr.Count
    if n == 0:
        return arr
    min_v = arr[0]
    max_v = arr[0]
    for v in arr:
        if v < min_v: min_v = v
        if v > max_v: max_v = v
    buckets = [List[of double]() for i in range(n)]
    for num in arr:
        idx = int((num - min_v) / (max_v - min_v + 1) * n)
        if idx >= n: idx = n - 1
        buckets[idx].Add(num)
    result = List[of double]()
    for bucket in buckets:
        insertion_sort(bucket)
        result.AddRange(bucket)
    return result

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
print(bucket_sort(data))
