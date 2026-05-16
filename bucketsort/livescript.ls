insertion-sort = (bucket) ->
    n = bucket.length
    for i from 1 to n - 1
        key = bucket[i]
        j = i - 1
        while j >= 0 and bucket[j] > key
            bucket[j + 1] = bucket[j]
            j--
        bucket[j + 1] = key
    bucket

bucket-sort = (arr) ->
    n = arr.length
    return arr if n is 0
    min-v = Math.min.apply null, arr
    max-v = Math.max.apply null, arr
    buckets = [[] for i from 0 to n - 1]
    for num in arr
        idx = Math.floor((num - min-v) / (max-v - min-v + 1) * n)
        idx = n - 1 if idx >= n
        buckets[idx].push num
    result = []
    for bucket in buckets
        for v in insertion-sort bucket
            result.push v
    result

data = [0.78 0.17 0.39 0.26 0.72 0.94 0.21 0.12 0.23 0.68]
console.log bucket-sort data
