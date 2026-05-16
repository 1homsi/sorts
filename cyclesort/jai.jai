cyclesort :: proc(arr: [6]int) -> [6]int {
  n := 6
  pos := 0
  while pos < n {
    item := arr[pos]
    cycles := 0
    for i in 0..n-1 {
      if i != pos && arr[i] < item {
        cycles += 1
      }
    }
    if cycles != 0 {
      while arr[pos] == item {
        pos += 1
      }
      temp := arr[pos]
      arr[pos] = item
      item = temp
      while cycles > 0 {
        cycles = 0
        for i in 0..n-1 {
          if i != pos && arr[i] < item {
            cycles += 1
          }
        }
        while arr[pos] == item {
          pos += 1
        }
        temp = arr[pos]
        arr[pos] = item
        item = temp
        cycles -= 1
      }
    }
    pos += 1
  }
  return arr
}

main :: proc() {
  arr := [6]int{5, 2, 8, 1, 9, 3}
  result := cyclesort(arr)
  for i in result {
    print(i)
    print(" ")
  }
}
