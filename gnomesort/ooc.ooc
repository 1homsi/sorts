gnomesort: func(arr: ArrayList<Int>) {
  i := 0
  while(i < arr size) {
    if(i == 0) {
      i += 1
    } else if(arr[i] < arr[i - 1]) {
      temp := arr[i]
      arr[i] = arr[i - 1]
      arr[i - 1] = temp
      i -= 1
    } else {
      i += 1
    }
  }
}

test := ArrayList<Int> new()
test add(5) add(2) add(8) add(1) add(9) add(3)
gnomesort(test)
test println()
