locals {
  input = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
  sorted = sort(local.input)
}

output "gnome_sorted" {
  value = local.sorted
}
