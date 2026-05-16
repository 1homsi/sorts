MIN_RUN <- 32L

insertion_sort <- function(arr, left, right) {
  for (i in seq(left + 1, right)) {
    key <- arr[i]
    j <- i - 1
    while (j >= left && arr[j] > key) {
      arr[j + 1] <- arr[j]
      j <- j - 1
    }
    arr[j + 1] <- key
  }
  arr
}

merge_runs <- function(arr, left, mid, right) {
  lp <- arr[left:mid]
  rp <- arr[(mid + 1):right]
  i <- 1; j <- 1; k <- left
  while (i <= length(lp) && j <= length(rp)) {
    if (lp[i] <= rp[j]) { arr[k] <- lp[i]; i <- i + 1 }
    else { arr[k] <- rp[j]; j <- j + 1 }
    k <- k + 1
  }
  while (i <= length(lp)) { arr[k] <- lp[i]; i <- i + 1; k <- k + 1 }
  while (j <= length(rp)) { arr[k] <- rp[j]; j <- j + 1; k <- k + 1 }
  arr
}

timsort <- function(arr) {
  n <- length(arr)
  i <- 1
  while (i <= n) {
    arr <- insertion_sort(arr, i, min(i + MIN_RUN - 1, n))
    i <- i + MIN_RUN
  }
  size <- MIN_RUN
  while (size < n) {
    left <- 1
    while (left <= n) {
      mid <- min(left + size - 1, n)
      right <- min(left + 2 * size - 1, n)
      if (mid < right) arr <- merge_runs(arr, left, mid, right)
      left <- left + 2 * size
    }
    size <- size * 2
  }
  arr
}

arr <- c(5, 2, 8, 1, 9, 3, 7, 4, 6)
print(timsort(arr))
