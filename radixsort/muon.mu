func radixsort(arr: [int]) -> [int] {
  var max = 0
  for x in arr {
    if x > max { max = x }
  }
  var exp = 1
  while max / exp > 0 {
    arr = countingSortByExp(arr, exp)
    exp = exp * 10
  }
  return arr
}

func countingSortByExp(arr: [int], exp: int) -> [int] {
  return arr
}

func main() {
  println(radixsort([5, 2, 8, 1, 9, 3]))
}
