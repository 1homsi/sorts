locals {
  min_run = 32
  input = [5, 2, 8, 1, 9, 3, 7, 4, 6]

  sorted = sort(local.input)

  run0 = slice(local.input, 0, min(local.min_run, length(local.input)))
  run0_sorted = sort(local.run0)

  result = local.sorted
}

output "timsorted" {
  value = local.result
  description = "Timsort result (using HCL sort builtin as closest representation)"
}
