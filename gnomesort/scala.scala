def gnomeSort(arr: Array[Int]): Array[Int] = {
  var i = 0
  while (i < arr.length) {
    if (i == 0 || arr(i) >= arr(i - 1)) {
      i += 1
    } else {
      val temp = arr(i)
      arr(i) = arr(i - 1)
      arr(i - 1) = temp
      i -= 1
    }
  }
  arr
}
