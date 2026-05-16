gnomesort :: (arr: [..]int) {
  i := 0
  while i < arr.count {
    if i == 0 {
      i += 1
    } else if arr[i] < arr[i - 1] {
      temp := arr[i]
      arr[i] = arr[i - 1]
      arr[i - 1] = temp
      i -= 1
    } else {
      i += 1
    }
  }
}

main :: () {
  test := int.[5, 2, 8, 1, 9, 3]
  gnomesort(test)
  for i : 0..test.count-1 {
    print("%\n", test[i])
  }
}
