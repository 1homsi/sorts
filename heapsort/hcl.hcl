locals {
  input = [12, 11, 13, 5, 6, 7]

  sorted = sort(local.input)
}

output "heapsort_result" {
  value = local.sorted
}
