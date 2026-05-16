import gleam/io
import gleam/list

fn is_sorted(arr: List(Int)) -> Bool {
  case arr {
    [] -> True
    [_] -> True
    [a, b, ..rest] -> a <= b && is_sorted([b, ..rest])
  }
}

fn shuffle(arr: List(Int)) -> List(Int) {
  arr
  |> list.index_map(fn(x, _) { x })
  |> list.shuffle
}

fn bogosort(arr: List(Int)) -> List(Int) {
  case is_sorted(arr) {
    True -> arr
    False -> bogosort(shuffle(arr))
  }
}

pub fn main() {
  let arr = [3, 1, 4, 1, 5, 9, 2, 6]
  io.debug(bogosort(arr))
}
