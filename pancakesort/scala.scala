object PancakeSort {
  def flip(arr: Array[Int], k: Int): Unit = {
    var left = 0; var right = k
    while (left < right) {
      val tmp = arr(left); arr(left) = arr(right); arr(right) = tmp
      left += 1; right -= 1
    }
  }

  def pancakeSort(arr: Array[Int]): Array[Int] = {
    var size = arr.length
    while (size > 1) {
      var maxIdx = 0
      for (i <- 1 until size) if (arr(i) > arr(maxIdx)) maxIdx = i
      if (maxIdx != size - 1) {
        if (maxIdx != 0) flip(arr, maxIdx)
        flip(arr, size - 1)
      }
      size -= 1
    }
    arr
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(3, 6, 2, 7, 4, 1, 5)
    println(pancakeSort(arr).mkString(", "))
  }
}
