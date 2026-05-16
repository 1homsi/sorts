locals {
  input = [64, 34, 25, 12, 22, 11, 90]
  sorted = sort(local.input)
}

output "sorted_array" {
  value = local.sorted
}
