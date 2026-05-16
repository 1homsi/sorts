object ShellSort {
  def shellSort(arr: Array[Int]): Array[Int] = {
    val n = arr.length
    var gap = n / 2
    while (gap > 0) {
      for (i <- gap until n) {
        val temp = arr(i)
        var j = i
        while (j >= gap && arr(j - gap) > temp) {
          arr(j) = arr(j - gap)
          j -= gap
        }
        arr(j) = temp
      }
      gap /= 2
    }
    arr
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(64, 34, 25, 12, 22, 11, 90)
    println(shellSort(arr).mkString(" "))
  }
}
