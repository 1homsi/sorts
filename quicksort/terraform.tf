locals {
  input = [3, 6, 8, 10, 1, 2, 1]
  sorted = sort(local.input)
}

output "sorted_array" {
  value = local.sorted
}
