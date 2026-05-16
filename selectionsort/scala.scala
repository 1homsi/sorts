def selectionSort(arr: Array[Int]): Array[Int] = {
  val n = arr.length
  for (i <- 0 until n) {
    var minIdx = i
    for (j <- i + 1 until n) {
      if (arr(j) < arr(minIdx)) minIdx = j
    }
    val tmp = arr(i); arr(i) = arr(minIdx); arr(minIdx) = tmp
  }
  arr
}
