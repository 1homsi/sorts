flip <- function(arr, k) {
  arr[1:(k+1)] <- rev(arr[1:(k+1)])
  arr
}

pancake_sort <- function(arr) {
  n <- length(arr)
  for (size in n:2) {
    max_idx <- which.max(arr[1:size])
    if (max_idx != size) {
      if (max_idx != 1) arr <- flip(arr, max_idx - 1)
      arr <- flip(arr, size - 1)
    }
  }
  arr
}

arr <- c(3, 6, 2, 7, 4, 1, 5)
print(pancake_sort(arr))
