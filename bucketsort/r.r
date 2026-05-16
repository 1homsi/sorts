insertion_sort <- function(bucket) {
  n <- length(bucket)
  if (n <= 1) return(bucket)
  for (i in 2:n) {
    key <- bucket[i]
    j <- i - 1
    while (j >= 1 && bucket[j] > key) {
      bucket[j + 1] <- bucket[j]
      j <- j - 1
    }
    bucket[j + 1] <- key
  }
  bucket
}

bucket_sort <- function(arr) {
  n <- length(arr)
  if (n == 0) return(arr)
  min_val <- min(arr)
  max_val <- max(arr)
  buckets <- vector("list", n)
  for (num in arr) {
    idx <- floor((num - min_val) / (max_val - min_val + 1) * n) + 1
    if (idx > n) idx <- n
    buckets[[idx]] <- c(buckets[[idx]], num)
  }
  result <- c()
  for (bucket in buckets) {
    if (length(bucket) > 0) {
      result <- c(result, insertion_sort(bucket))
    }
  }
  result
}

data <- c(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)
print(bucket_sort(data))
