import gleam/io
import gleam/list
import gleam/int

pub fn counting_sort(arr: List(Int)) -> List(Int) {
  case arr {
    [] -> []
    _ -> list.sort(arr, int.compare)
  }
}

pub fn main() {
  let arr = [4, 2, 2, 8, 3, 3, 1]
  io.debug(counting_sort(arr))
}
