locals {
  input = [170, 45, 75, 90, 802, 24, 2, 66]

  pass0 = sort([for v in local.input : format("%d", v)])

  digit0 = [for v in local.input : v % 10]
  bucket0 = {
    for d in range(10) :
    d => [for v in local.input : v if v % 10 == d]
  }
  sorted0 = flatten([for d in range(10) : lookup(local.bucket0, d, [])])

  digit1 = [for v in local.sorted0 : floor(v / 10) % 10]
  bucket1 = {
    for d in range(10) :
    d => [for v in local.sorted0 : v if floor(v / 10) % 10 == d]
  }
  sorted1 = flatten([for d in range(10) : lookup(local.bucket1, d, [])])

  digit2 = [for v in local.sorted1 : floor(v / 100) % 10]
  bucket2 = {
    for d in range(10) :
    d => [for v in local.sorted1 : v if floor(v / 100) % 10 == d]
  }
  sorted = flatten([for d in range(10) : lookup(local.bucket2, d, [])])
}

output "sorted" {
  value = local.sorted
}
