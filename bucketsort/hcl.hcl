locals {
  arr    = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
  n      = length(local.arr)
  min_v  = min(local.arr...)
  max_v  = max(local.arr...)

  bucket_indices = [
    for val in local.arr :
    min(local.n - 1, floor((val - local.min_v) / (local.max_v - local.min_v + 1) * local.n))
  ]

  buckets = {
    for i in range(local.n) :
    i => [
      for j, val in local.arr :
      val
      if local.bucket_indices[j] == i
    ]
  }

  sorted_buckets = {
    for i, bucket in local.buckets :
    i => sort(bucket)
  }

  sorted = flatten([
    for i in range(local.n) :
    lookup(local.sorted_buckets, i, [])
  ])
}

output "sorted_array" {
  value = local.sorted
}
