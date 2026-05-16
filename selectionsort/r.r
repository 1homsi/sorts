selection_sort <- function(arr) {
  n <- length(arr)
  for (i in 1:(n - 1)) {
    min_idx <- i
    for (j in (i + 1):n) {
      if (arr[j] < arr[min_idx]) min_idx <- j
    }
    tmp <- arr[i]; arr[i] <- arr[min_idx]; arr[min_idx] <- tmp
  }
  arr
}
