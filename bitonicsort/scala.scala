object BitonicSort {
  def compareAndSwap(arr: Array[Int], i: Int, j: Int, direction: Boolean): Unit = {
    if (direction == (arr(i) > arr(j))) {
      val tmp = arr(i); arr(i) = arr(j); arr(j) = tmp
    }
  }

  def bitonicMerge(arr: Array[Int], lo: Int, cnt: Int, direction: Boolean): Unit = {
    if (cnt > 1) {
      val k = cnt / 2
      for (i <- lo until lo + k) compareAndSwap(arr, i, i + k, direction)
      bitonicMerge(arr, lo, k, direction)
      bitonicMerge(arr, lo + k, k, direction)
    }
  }

  def bitonicSort(arr: Array[Int], lo: Int, cnt: Int, direction: Boolean): Unit = {
    if (cnt > 1) {
      val k = cnt / 2
      bitonicSort(arr, lo, k, true)
      bitonicSort(arr, lo + k, k, false)
      bitonicMerge(arr, lo, cnt, direction)
    }
  }

  def main(args: Array[String]): Unit = {
    val data = Array(3, 7, 4, 8, 6, 2, 1, 5)
    bitonicSort(data, 0, data.length, true)
    println(data.mkString(" "))
  }
}
