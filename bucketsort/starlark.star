def insertion_sort(bucket):
    n = len(bucket)
    for i in range(1, n):
        key = bucket[i]
        j = i - 1
        while j >= 0 and bucket[j] > key:
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key
    return bucket

def bucket_sort(arr):
    n = len(arr)
    if n == 0:
        return arr
    min_v = min(arr)
    max_v = max(arr)
    buckets = [[] for _ in range(n)]
    for num in arr:
        idx = int((num - min_v) / (max_v - min_v + 1) * n)
        if idx >= n:
            idx = n - 1
        buckets[idx].append(num)
    result = []
    for bucket in buckets:
        for v in insertion_sort(bucket):
            result.append(v)
    return result

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
print(bucket_sort(data))
