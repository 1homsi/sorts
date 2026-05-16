def quicksort(arr: List[Int]): List[Int] = arr match {
  case Nil => Nil
  case head :: tail =>
    val pivot = head
    val left = tail.filter(_ < pivot)
    val right = tail.filter(_ >= pivot)
    quicksort(left) ::: pivot :: quicksort(right)
}

println(quicksort(List(3, 6, 8, 10, 1, 2, 1)))
