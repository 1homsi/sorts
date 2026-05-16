shell_sort <- function(arr) {
  n <- length(arr)
  gap <- n %/% 2
  while (gap > 0) {
    for (i in (gap + 1):n) {
      temp <- arr[i]
      j <- i
      while (j > gap && arr[j - gap] > temp) {
        arr[j] <- arr[j - gap]
        j <- j - gap
      }
      arr[j] <- temp
    }
    gap <- gap %/% 2
  }
  arr
}

arr <- c(64, 34, 25, 12, 22, 11, 90)
print(shell_sort(arr))
