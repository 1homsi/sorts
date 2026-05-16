locals {
  input = [5, 4, 3, 2, 1]

  sorted = sort(local.input)
}

output "sorted" {
  value = local.sorted
}
