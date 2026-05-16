quicksort: func(arr: ArrayList<Int>) -> ArrayList<Int> {
  if (arr size <= 1) return arr

  pivot := arr[0]
  less := ArrayList<Int> new()
  greater := ArrayList<Int> new()

  for (i in 1..arr size) {
    if (arr[i] <= pivot) {
      less add(arr[i])
    } else {
      greater add(arr[i])
    }
  }

  result := ArrayList<Int> new()
  for (x in quicksort(less)) result add(x)
  result add(pivot)
  for (x in quicksort(greater)) result add(x)
  result
}

arr := ArrayList<Int> new(5, 2, 8, 1, 9, 3)
quicksort(arr) println()