object CycleSort {
  def cycleSort(arr: Array[Int]): Int = {
    var writes = 0
    val n = arr.length
    for (cycleStart <- 0 until n - 1) {
      var item = arr(cycleStart)
      var pos = cycleStart
      for (i <- cycleStart + 1 until n) {
        if (arr(i) < item) pos += 1
      }
      if (pos != cycleStart) {
        while (item == arr(pos)) pos += 1
        val tmp = arr(pos); arr(pos) = item; item = tmp
        writes += 1
        while (pos != cycleStart) {
          pos = cycleStart
          for (i <- cycleStart + 1 until n) {
            if (arr(i) < item) pos += 1
          }
          while (item == arr(pos)) pos += 1
          val t = arr(pos); arr(pos) = item; item = t
          writes += 1
        }
      }
    }
    writes
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(5, 4, 3, 2, 1)
    cycleSort(arr)
    println(arr.mkString(", "))
  }
}
