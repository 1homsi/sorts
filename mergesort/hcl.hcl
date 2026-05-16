locals {
    input = [38, 27, 43, 3, 9, 82, 10]
    sorted = sort(local.input)
}

output "sorted" {
    value = local.sorted
}
