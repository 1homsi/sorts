comb_sort <- function(arr) {
  n <- length(arr)
  gap <- n
  shrink <- 1.3
  sorted <- FALSE
  while (!sorted) {
    gap <- floor(gap / shrink)
    if (gap <= 1) {
      gap <- 1
      sorted <- TRUE
    }
    for (i in 1:(n - gap)) {
      if (arr[i] > arr[i + gap]) {
        tmp <- arr[i]
        arr[i] <- arr[i + gap]
        arr[i + gap] <- tmp
        sorted <- FALSE
      }
    }
  }
  arr
}
