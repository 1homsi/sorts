object MergeSort {
  def mergeSort(arr: List[Int]): List[Int] = {
    if (arr.length <= 1) return arr
    val mid = arr.length / 2
    val left = mergeSort(arr.take(mid))
    val right = mergeSort(arr.drop(mid))
    merge(left, right)
  }

  def merge(left: List[Int], right: List[Int]): List[Int] = (left, right) match {
    case (Nil, _) => right
    case (_, Nil) => left
    case (lh :: lt, rh :: rt) =>
      if (lh <= rh) lh :: merge(lt, right)
      else rh :: merge(left, rt)
  }

  def main(args: Array[String]): Unit = {
    val arr = List(38, 27, 43, 3, 9, 82, 10)
    println(mergeSort(arr))
  }
}
