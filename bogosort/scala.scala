def bogosort(arr: Array[Int]): Array[Int] = {
    while (!arr.dropRight(1).zipWithIndex.forall { case (v, i) => v <= arr(i + 1) }) {
        scala.util.Random.shuffle(arr.toList).copyToArray(arr)
    }
    arr
}
