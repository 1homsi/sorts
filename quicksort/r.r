quicksort <- function(arr) {
  if (length(arr) <= 1) return(arr)
  pivot <- arr[ceiling(length(arr) / 2)]
  left <- arr[arr < pivot]
  middle <- arr[arr == pivot]
  right <- arr[arr > pivot]
  c(quicksort(left), middle, quicksort(right))
}

print(quicksort(c(3, 6, 8, 10, 1, 2, 1)))
