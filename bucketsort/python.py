def insertion_sort(bucket):
    for i in range(1, len(bucket)):
        key = bucket[i]
        j = i - 1
        while j >= 0 and bucket[j] > key:
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key
    return bucket

def bucket_sort(arr):
    if len(arr) == 0:
        return arr
    min_val = min(arr)
    max_val = max(arr)
    bucket_count = len(arr)
    buckets = [[] for _ in range(bucket_count)]
    for num in arr:
        index = int((num - min_val) / (max_val - min_val + 1) * bucket_count)
        buckets[index].append(num)
    result = []
    for bucket in buckets:
        insertion_sort(bucket)
        result.extend(bucket)
    return result

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
print(bucket_sort(data))
