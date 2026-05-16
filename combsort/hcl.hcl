locals {
  input = [5, 3, 8, 1, 9, 2, 7, 4, 6]
  n     = length(local.input)

  new_gap = floor(local.n / 1.3) > 1 ? floor(local.n / 1.3) : 1
}

output "note" {
  value = "HCL is declarative config; comb sort expressed as gap reduction: initial gap=${local.n}, first new gap=${local.new_gap}"
}
