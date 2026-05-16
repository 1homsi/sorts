radixsort :: (arr: [] int) -> [] int {
  max := 0
  for x in arr {
    if x > max {
      max = x
    }
  }
  exp := 1
  while max / exp > 0 {
    arr = countingSortByExp(arr, exp)
    exp = exp * 10
  }
  return arr
}

countingSortByExp :: (arr: [] int, exp: int) -> [] int {
  return arr
}

main :: () {
  arr := int.[5, 2, 8, 1, 9, 3]
  result := radixsort(arr)
  print(result)
}
