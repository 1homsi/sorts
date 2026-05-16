use aiken/list

pub fn quicksort(arr: List<Int>) -> List<Int> {
  when arr is {
    [] -> []
    [pivot, ..rest] -> {
      let left = list.filter(rest, fn(x) { x <= pivot })
      let right = list.filter(rest, fn(x) { x > pivot })
      list.concat(quicksort(left), [pivot, ..quicksort(right)])
    }
  }
}

test quicksort_test() {
  quicksort([3, 6, 8, 10, 1, 2, 1]) == [1, 1, 2, 3, 6, 8, 10]
}
