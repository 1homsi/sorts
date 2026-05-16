cycle_sort <- function(arr) {
  n <- length(arr)
  writes <- 0
  for (cycle_start in 1:(n - 1)) {
    item <- arr[cycle_start]
    pos <- cycle_start
    if (cycle_start + 1 <= n) {
      for (i in (cycle_start + 1):n) {
        if (arr[i] < item) pos <- pos + 1
      }
    }
    if (pos == cycle_start) next
    while (item == arr[pos]) pos <- pos + 1
    tmp <- arr[pos]
    arr[pos] <- item
    item <- tmp
    writes <- writes + 1
    while (pos != cycle_start) {
      pos <- cycle_start
      for (i in (cycle_start + 1):n) {
        if (arr[i] < item) pos <- pos + 1
      }
      while (item == arr[pos]) pos <- pos + 1
      tmp <- arr[pos]
      arr[pos] <- item
      item <- tmp
      writes <- writes + 1
    }
  }
  arr
}

arr <- c(5, 4, 3, 2, 1)
result <- cycle_sort(arr)
print(result)
