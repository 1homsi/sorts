cocktail_sort <- function(arr) {
  n <- length(arr)
  swapped <- TRUE
  start <- 1
  ending <- n
  while (swapped) {
    swapped <- FALSE
    for (i in start:(ending - 1)) {
      if (arr[i] > arr[i + 1]) {
        tmp <- arr[i]
        arr[i] <- arr[i + 1]
        arr[i + 1] <- tmp
        swapped <- TRUE
      }
    }
    if (!swapped) break
    swapped <- FALSE
    ending <- ending - 1
    if (ending - 1 >= start) {
      for (i in (ending - 1):start) {
        if (arr[i] > arr[i + 1]) {
          tmp <- arr[i]
          arr[i] <- arr[i + 1]
          arr[i + 1] <- tmp
          swapped <- TRUE
        }
      }
    }
    start <- start + 1
  }
  arr
}
