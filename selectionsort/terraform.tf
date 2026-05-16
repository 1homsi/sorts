locals {
  input  = [5, 3, 1, 4, 2]
  sorted = sort([for v in local.input : tostring(v)])
}

output "sorted" {
  value = local.sorted
}
