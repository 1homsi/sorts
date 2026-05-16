import scala.collection.mutable.ArrayBuffer

def combSort(arr: ArrayBuffer[Int]): ArrayBuffer[Int] = {
  val n = arr.length
  var gap = n
  val shrink = 1.3
  var sorted = false
  while (!sorted) {
    gap = (gap / shrink).toInt
    if (gap <= 1) {
      gap = 1
      sorted = true
    }
    var i = 0
    while (i + gap < n) {
      if (arr(i) > arr(i + gap)) {
        val tmp = arr(i)
        arr(i) = arr(i + gap)
        arr(i + gap) = tmp
        sorted = false
      }
      i += 1
    }
  }
  arr
}
