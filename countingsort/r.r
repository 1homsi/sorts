counting_sort <- function(arr) {
  if (length(arr) == 0) return(arr)
  min_val <- min(arr)
  max_val <- max(arr)
  range_val <- max_val - min_val + 1
  count <- integer(range_val)
  for (v in arr) count[v - min_val + 1] <- count[v - min_val + 1] + 1
  for (i in 2:range_val) count[i] <- count[i] + count[i - 1]
  output <- integer(length(arr))
  for (i in length(arr):1) {
    idx <- arr[i] - min_val + 1
    output[count[idx]] <- arr[i]
    count[idx] <- count[idx] - 1
  }
  output
}

cat(counting_sort(c(4, 2, 2, 8, 3, 3, 1)), "\n")
