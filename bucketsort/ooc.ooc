BucketSort: func (arr: List<Int>, maxVal: Int) -> List<Int> {
  if (maxVal == 0) return arr
  buckets := List<List<Int>> new()
  for (i in 0..maxVal) {
    buckets add(List<Int> new())
  }
  for (num in arr) {
    idx := num
    if (idx >= 0 && idx < maxVal) {
      buckets[idx] add(num)
    }
  }
  result := List<Int> new()
  for (bucket in buckets) {
    for (num in bucket) {
      result add(num)
    }
  }
  result
}
bucketSort([5, 2, 8, 1, 9, 3], 10) toString() println()