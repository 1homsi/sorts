insertion_sort = (bucket) ->
    n = #bucket
    for i = 2, n
        key = bucket[i]
        j = i - 1
        while j >= 1 and bucket[j] > key
            bucket[j + 1] = bucket[j]
            j -= 1
        bucket[j + 1] = key
    bucket

bucket_sort = (arr) ->
    n = #arr
    return arr if n == 0
    min_v = math.huge
    max_v = -math.huge
    for v in *arr
        min_v = math.min min_v, v
        max_v = math.max max_v, v
    buckets = [{} for i = 1, n]
    for num in *arr
        idx = math.floor((num - min_v) / (max_v - min_v + 1) * n) + 1
        idx = n if idx > n
        table.insert buckets[idx], num
    result = {}
    for bucket in *buckets
        for v in *insertion_sort bucket
            table.insert result, v
    result

data = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
sorted = bucket_sort data
print table.concat sorted, " "
