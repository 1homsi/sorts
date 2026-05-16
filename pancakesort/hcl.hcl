locals {
  input = [3, 6, 2, 7, 4, 1, 5]

  flip = { for i, v in local.input : i => v }

  description = "Pancake sort: flip prefix containing max element to front, then flip entire unsorted portion to move max to its position. Repeat reducing size by 1."

  sorted_note = "HCL/Terraform is declarative; imperative pancake sort requires external data source or null_resource with local-exec"
}

output "original_array" {
  value = local.input
}

output "algorithm" {
  value = local.description
}
