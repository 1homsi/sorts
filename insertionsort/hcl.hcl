locals {
  input_list = [5, 3, 1, 4, 2]
  sorted     = sort(local.input_list)
}

output "sorted_list" {
  value = local.sorted
}
