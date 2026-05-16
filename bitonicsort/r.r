compare_and_swap <- function(arr, i, j, direction) {
  if (direction == (arr[i] > arr[j])) {
    tmp <- arr[i]
    arr[i] <- arr[j]
    arr[j] <- tmp
  }
  arr
}

bitonic_merge <- function(arr, lo, cnt, direction) {
  if (cnt > 1) {
    k <- cnt %/% 2
    for (i in lo:(lo + k - 1)) {
      arr <- compare_and_swap(arr, i, i + k, direction)
    }
    arr <- bitonic_merge(arr, lo, k, direction)
    arr <- bitonic_merge(arr, lo + k, k, direction)
  }
  arr
}

bitonic_sort <- function(arr, lo, cnt, direction) {
  if (cnt > 1) {
    k <- cnt %/% 2
    arr <- bitonic_sort(arr, lo, k, TRUE)
    arr <- bitonic_sort(arr, lo + k, k, FALSE)
    arr <- bitonic_merge(arr, lo, cnt, direction)
  }
  arr
}

data <- c(3, 7, 4, 8, 6, 2, 1, 5)
result <- bitonic_sort(data, 1, length(data), TRUE)
print(result)
