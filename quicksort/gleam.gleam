import gleam/list
import gleam/io

pub fn quicksort(lst: List(Int)) -> List(Int) {
  case lst {
    [] -> []
    [pivot, ..rest] -> {
      let left = list.filter(rest, fn(x) { x <= pivot })
      let right = list.filter(rest, fn(x) { x > pivot })
      list.concat([quicksort(left), [pivot], quicksort(right)])
    }
  }
}

pub fn main() {
  io.debug(quicksort([3, 6, 8, 10, 1, 2, 1]))
}
