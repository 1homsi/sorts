object RadixSort {
  def countingSort(arr: Array[Int], exp: Int): Unit = {
    val n = arr.length
    val output = new Array[Int](n)
    val count = new Array[Int](10)
    for (i <- 0 until n) count((arr(i) / exp) % 10) += 1
    for (i <- 1 until 10) count(i) += count(i - 1)
    for (i <- (0 until n).reverse) {
      val idx = (arr(i) / exp) % 10
      count(idx) -= 1
      output(count(idx)) = arr(i)
    }
    output.copyToArray(arr)
  }

  def radixSort(arr: Array[Int]): Unit = {
    if (arr.isEmpty) return
    val max = arr.max
    var exp = 1
    while (max / exp > 0) {
      countingSort(arr, exp)
      exp *= 10
    }
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(170, 45, 75, 90, 802, 24, 2, 66)
    radixSort(arr)
    println(arr.mkString(", "))
  }
}
