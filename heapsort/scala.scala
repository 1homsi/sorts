object Heapsort {
  def heapify(arr: Array[Int], n: Int, i: Int): Unit = {
    var largest = i
    val left = 2 * i + 1
    val right = 2 * i + 2
    if (left < n && arr(left) > arr(largest)) largest = left
    if (right < n && arr(right) > arr(largest)) largest = right
    if (largest != i) {
      val tmp = arr(i); arr(i) = arr(largest); arr(largest) = tmp
      heapify(arr, n, largest)
    }
  }

  def heapsort(arr: Array[Int]): Unit = {
    val n = arr.length
    for (i <- n / 2 - 1 to 0 by -1) heapify(arr, n, i)
    for (i <- n - 1 to 1 by -1) {
      val tmp = arr(0); arr(0) = arr(i); arr(i) = tmp
      heapify(arr, i, 0)
    }
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(12, 11, 13, 5, 6, 7)
    heapsort(arr)
    println(arr.mkString(" "))
  }
}
