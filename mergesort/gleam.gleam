import gleam/io
import gleam/list
import gleam/int

fn merge(left: List(Int), right: List(Int)) -> List(Int) {
  case left, right {
    [], _ -> right
    _, [] -> left
    [lh, ..lt], [rh, ..rt] ->
      case lh <= rh {
        True -> [lh, ..merge(lt, right)]
        False -> [rh, ..merge(left, rt)]
      }
  }
}

fn merge_sort(lst: List(Int)) -> List(Int) {
  let n = list.length(lst)
  case n <= 1 {
    True -> lst
    False -> {
      let mid = n / 2
      let left = list.take(lst, mid)
      let right = list.drop(lst, mid)
      merge(merge_sort(left), merge_sort(right))
    }
  }
}

pub fn main() {
  let arr = [38, 27, 43, 3, 9, 82, 10]
  io.debug(merge_sort(arr))
}
