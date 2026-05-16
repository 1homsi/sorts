import gleam/io
import gleam/list

fn bubble_pass(lst: List(Int)) -> #(List(Int), Bool) {
  case lst {
    [] -> #([], False)
    [x] -> #([x], False)
    [x, y, ..rest] ->
      case x > y {
        True -> {
          let #(sorted, _) = bubble_pass([x, ..rest])
          #([y, ..sorted], True)
        }
        False -> {
          let #(sorted, sw) = bubble_pass([y, ..rest])
          #([x, ..sorted], sw)
        }
      }
  }
}

fn bubble_sort(lst: List(Int)) -> List(Int) {
  let #(sorted, swapped) = bubble_pass(lst)
  case swapped {
    True -> bubble_sort(sorted)
    False -> sorted
  }
}

pub fn main() {
  let arr = [64, 34, 25, 12, 22, 11, 90]
  io.debug(bubble_sort(arr))
}
