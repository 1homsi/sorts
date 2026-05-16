object TimSort {
  val MIN_RUN = 32

  def insertionSort(arr: Array[Int], left: Int, right: Int): Unit = {
    for (i <- left + 1 to right) {
      val key = arr(i)
      var j = i - 1
      while (j >= left && arr(j) > key) {
        arr(j + 1) = arr(j)
        j -= 1
      }
      arr(j + 1) = key
    }
  }

  def merge(arr: Array[Int], left: Int, mid: Int, right: Int): Unit = {
    val leftPart = arr.slice(left, mid + 1)
    val rightPart = arr.slice(mid + 1, right + 1)
    var i = 0; var j = 0; var k = left
    while (i < leftPart.length && j < rightPart.length) {
      if (leftPart(i) <= rightPart(j)) { arr(k) = leftPart(i); i += 1 }
      else { arr(k) = rightPart(j); j += 1 }
      k += 1
    }
    while (i < leftPart.length) { arr(k) = leftPart(i); i += 1; k += 1 }
    while (j < rightPart.length) { arr(k) = rightPart(j); j += 1; k += 1 }
  }

  def timsort(arr: Array[Int]): Unit = {
    val n = arr.length
    var i = 0
    while (i < n) {
      insertionSort(arr, i, math.min(i + MIN_RUN - 1, n - 1))
      i += MIN_RUN
    }
    var size = MIN_RUN
    while (size < n) {
      var left = 0
      while (left < n) {
        val mid = math.min(left + size - 1, n - 1)
        val right = math.min(left + 2 * size - 1, n - 1)
        if (mid < right) merge(arr, left, mid, right)
        left += 2 * size
      }
      size *= 2
    }
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(5, 2, 8, 1, 9, 3, 7, 4, 6)
    timsort(arr)
    println(arr.mkString(", "))
  }
}
