import scala.collection.mutable.ArrayBuffer

def cocktailSort(arr: ArrayBuffer[Int]): ArrayBuffer[Int] = {
  var swapped = true
  var start = 0
  var end = arr.length - 1
  while (swapped) {
    swapped = false
    for (i <- start until end) {
      if (arr(i) > arr(i + 1)) {
        val temp = arr(i)
        arr(i) = arr(i + 1)
        arr(i + 1) = temp
        swapped = true
      }
    }
    if (!swapped) return arr
    swapped = false
    end -= 1
    for (i <- (start until end).reverse) {
      if (arr(i) > arr(i + 1)) {
        val temp = arr(i)
        arr(i) = arr(i + 1)
        arr(i + 1) = temp
        swapped = true
      }
    }
    start += 1
  }
  arr
}
