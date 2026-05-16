locals {
  data = [3, 7, 4, 8, 6, 2, 1, 5]
  sorted = sort(local.data)
}

output "sorted" {
  value = local.sorted
}
