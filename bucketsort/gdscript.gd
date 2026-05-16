func insertion_sort(bucket: Array) -> Array:
    var n = bucket.size()
    for i in range(1, n):
        var key = bucket[i]
        var j = i - 1
        while j >= 0 and bucket[j] > key:
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key
    return bucket

func bucket_sort(arr: Array) -> Array:
    var n = arr.size()
    if n == 0:
        return arr
    var min_v = arr[0]
    var max_v = arr[0]
    for v in arr:
        if v < min_v:
            min_v = v
        if v > max_v:
            max_v = v
    var buckets = []
    for i in range(n):
        buckets.append([])
    for num in arr:
        var idx = int((num - min_v) / (max_v - min_v + 1) * n)
        if idx >= n:
            idx = n - 1
        buckets[idx].append(num)
    var result = []
    for bucket in buckets:
        var sorted = insertion_sort(bucket)
        result.append_array(sorted)
    return result

func _ready():
    var data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
    print(bucket_sort(data))
