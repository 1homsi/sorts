import sequtils, math

proc insertionSort(bucket: var seq[float]) =
  let n = bucket.len
  for i in 1..<n:
    let key = bucket[i]
    var j = i - 1
    while j >= 0 and bucket[j] > key:
      bucket[j + 1] = bucket[j]
      dec j
    bucket[j + 1] = key

proc bucketSort(arr: seq[float]): seq[float] =
  let n = arr.len
  if n == 0: return arr
  let minV = arr.min
  let maxV = arr.max
  var buckets = newSeq[seq[float]](n)
  for num in arr:
    var idx = int((num - minV) / (maxV - minV + 1) * float(n))
    if idx >= n: idx = n - 1
    buckets[idx].add(num)
  result = @[]
  for bucket in buckets.mitems:
    insertionSort(bucket)
    result.add(bucket)

let data = @[0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
echo bucketSort(data)
