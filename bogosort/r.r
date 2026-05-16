is_sorted <- function(arr) {
  all(arr[-length(arr)] <= arr[-1])
}

bogosort <- function(arr) {
  while (!is_sorted(arr)) {
    arr <- sample(arr)
  }
  arr
}

arr <- c(3, 1, 4, 1, 5, 9, 2, 6)
print(bogosort(arr))
