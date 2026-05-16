locals {
    input = [3, 1, 4, 1, 5, 9, 2, 6]
    sorted = sort(local.input)
}

output "sorted_array" {
    value = local.sorted
}
