object CountingSort {
  def countingSort(arr: Array[Int]): Array[Int] = {
    if (arr.isEmpty) return arr
    val max = arr.max
    val min = arr.min
    val range = max - min + 1
    val count = Array.fill(range)(0)
    arr.foreach(v => count(v - min) += 1)
    for (i <- 1 until range) count(i) += count(i - 1)
    val output = Array.fill(arr.length)(0)
    for (i <- arr.indices.reverse) {
      count(arr(i) - min) -= 1
      output(count(arr(i) - min)) = arr(i)
    }
    output
  }

  def main(args: Array[String]): Unit = {
    println(countingSort(Array(4, 2, 2, 8, 3, 3, 1)).mkString(" "))
  }
}
