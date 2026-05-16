bubble_sort <- function(arr) {
  n <- length(arr)
  repeat {
    swapped <- FALSE
    for (i in 1:(n - 1)) {
      if (arr[i] > arr[i + 1]) {
        tmp <- arr[i]
        arr[i] <- arr[i + 1]
        arr[i + 1] <- tmp
        swapped <- TRUE
      }
    }
    n <- n - 1
    if (!swapped) break
  }
  arr
}

arr <- c(64, 34, 25, 12, 22, 11, 90)
print(bubble_sort(arr))
