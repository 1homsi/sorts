object BubbleSort {
  def bubbleSort(arr: Array[Int]): Array[Int] = {
    var n = arr.length
    var swapped = true
    while (swapped) {
      swapped = false
      for (i <- 0 until n - 1) {
        if (arr(i) > arr(i + 1)) {
          val tmp = arr(i)
          arr(i) = arr(i + 1)
          arr(i + 1) = tmp
          swapped = true
        }
      }
      n -= 1
    }
    arr
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(64, 34, 25, 12, 22, 11, 90)
    println(bubbleSort(arr).mkString(" "))
  }
}
