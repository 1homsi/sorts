heapify <- function(arr, n, i) {
  largest <- i
  left <- 2 * i
  right <- 2 * i + 1
  if (left <= n && arr[left] > arr[largest]) largest <- left
  if (right <= n && arr[right] > arr[largest]) largest <- right
  if (largest != i) {
    tmp <- arr[i]; arr[i] <- arr[largest]; arr[largest] <- tmp
    arr <- heapify(arr, n, largest)
  }
  arr
}

heapsort <- function(arr) {
  n <- length(arr)
  for (i in seq(floor(n / 2), 1, -1)) arr <- heapify(arr, n, i)
  for (i in seq(n, 2, -1)) {
    tmp <- arr[1]; arr[1] <- arr[i]; arr[i] <- tmp
    arr <- heapify(arr, i - 1, 1)
  }
  arr
}

arr <- c(12, 11, 13, 5, 6, 7)
print(heapsort(arr))
