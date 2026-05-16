locals {
  arr = [3, 1, 4, 1, 5, 9, 2, 6]

  is_sorted = alltrue([
    for i in range(length(local.arr) - 1) :
    local.arr[i] <= local.arr[i + 1]
  ])

  bogosort_result = sort(local.arr)
}

output "sorted" {
  value = local.bogosort_result
}
