object BucketSort {
  def insertionSort(bucket: Array[Double]): Array[Double] = {
    for (i <- 1 until bucket.length) {
      val key = bucket(i)
      var j = i - 1
      while (j >= 0 && bucket(j) > key) {
        bucket(j + 1) = bucket(j)
        j -= 1
      }
      bucket(j + 1) = key
    }
    bucket
  }

  def bucketSort(arr: Array[Double]): Array[Double] = {
    val n = arr.length
    if (n == 0) return arr
    val min = arr.min
    val max = arr.max
    val buckets = Array.fill(n)(scala.collection.mutable.ArrayBuffer[Double]())
    for (num <- arr) {
      var idx = ((num - min) / (max - min + 1) * n).toInt
      if (idx >= n) idx = n - 1
      buckets(idx) += num
    }
    buckets.flatMap(b => insertionSort(b.toArray))
  }

  def main(args: Array[String]): Unit = {
    println(bucketSort(Array(0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68)).mkString(", "))
  }
}
