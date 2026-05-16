locals {
  input = [5, 3, 1, 4, 2]
  sorted = sort(local.input)
}

output "sorted" {
  value = local.sorted
}
