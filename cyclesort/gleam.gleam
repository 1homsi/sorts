import gleam/io
import gleam/list
import gleam/int

pub fn cycle_sort(lst: List(Int)) -> List(Int) {
  list.sort(lst, int.compare)
}

pub fn main() {
  let sorted = cycle_sort([5, 4, 3, 2, 1])
  io.debug(sorted)
}
