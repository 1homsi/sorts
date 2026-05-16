insertionSort = (bucket) ->
  for i in [1...bucket.length]
    key = bucket[i]
    j = i - 1
    while j >= 0 and bucket[j] > key
      bucket[j + 1] = bucket[j]
      j--
    bucket[j + 1] = key
  bucket

bucketSort = (arr) ->
  return arr if arr.length is 0
  n = arr.length
  min = Math.min arr...
  max = Math.max arr...
  buckets = ([] for i in [0...n])
  for num in arr
    idx = Math.floor ((num - min) / (max - min + 1)) * n
    idx = n - 1 if idx >= n
    buckets[idx].push num
  result = []
  for bucket in buckets
    result = result.concat insertionSort bucket
  result

console.log bucketSort [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
