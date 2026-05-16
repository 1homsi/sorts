gnome_sort <- function(arr) {
  i <- 1
  n <- length(arr)
  while (i <= n) {
    if (i == 1 || arr[i] >= arr[i - 1]) {
      i <- i + 1
    } else {
      tmp <- arr[i]
      arr[i] <- arr[i - 1]
      arr[i - 1] <- tmp
      i <- i - 1
    }
  }
  arr
}
