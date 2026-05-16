counting_sort <- function(arr, exp) {
  n <- length(arr)
  output <- integer(n)
  count <- integer(10)
  for (i in seq_len(n)) {
    idx <- (arr[i] %/% exp) %% 10 + 1
    count[idx] <- count[idx] + 1
  }
  for (i in 2:10) count[i] <- count[i] + count[i - 1]
  for (i in n:1) {
    idx <- (arr[i] %/% exp) %% 10 + 1
    output[count[idx]] <- arr[i]
    count[idx] <- count[idx] - 1
  }
  output
}

radix_sort <- function(arr) {
  if (length(arr) == 0) return(arr)
  max_val <- max(arr)
  exp <- 1
  while (max_val %/% exp > 0) {
    arr <- counting_sort(arr, exp)
    exp <- exp * 10
  }
  arr
}

arr <- c(170, 45, 75, 90, 802, 24, 2, 66)
print(radix_sort(arr))
