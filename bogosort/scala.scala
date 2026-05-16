import scala.util.Random

def isSorted(arr: List[Int]): Boolean =
  arr.sliding(2).forall { case List(a, b) => a <= b; case _ => true }

def bogosort(arr: List[Int]): List[Int] = {
  var result = arr
  while (!isSorted(result)) {
    result = Random.shuffle(result)
  }
  result
}

@main def run(): Unit =
  val arr = List(3, 1, 4, 1, 5, 9, 2, 6)
  println(bogosort(arr))
