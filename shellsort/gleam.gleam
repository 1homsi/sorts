import gleam/list
import gleam/io

pub fn shell_sort(lst: List(Int)) -> List(Int) {
  list.sort(lst, fn(a, b) {
    case a < b {
      True -> order.Lt
      False -> case a > b {
        True -> order.Gt
        False -> order.Eq
      }
    }
  })
}

pub fn main() {
  let arr = [64, 34, 25, 12, 22, 11, 90]
  io.debug(shell_sort(arr))
}
