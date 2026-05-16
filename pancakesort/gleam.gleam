import gleam/io
import gleam/list
import gleam/int

fn flip(arr: List(Int), k: Int) -> List(Int) {
  let front = list.take(arr, k + 1)
  let back = list.drop(arr, k + 1)
  list.append(list.reverse(front), back)
}

fn find_max_idx(arr: List(Int), size: Int) -> Int {
  let sub = list.take(arr, size)
  let max_val = list.fold(sub, 0, fn(acc, x) { int.max(acc, x) })
  let #(_, idx) = list.index_fold(sub, #(0, 0), fn(acc, x, i) {
    let #(_, best_i) = acc
    case x == max_val {
      True -> #(x, i)
      False -> acc
    }
  })
  idx
}

fn sort(arr: List(Int), size: Int) -> List(Int) {
  case size <= 1 {
    True -> arr
    False -> {
      let max_idx = find_max_idx(arr, size)
      let arr1 = case max_idx != 0 {
        True -> flip(arr, max_idx)
        False -> arr
      }
      let arr2 = flip(arr1, size - 1)
      sort(arr2, size - 1)
    }
  }
}

pub fn pancake_sort(arr: List(Int)) -> List(Int) {
  sort(arr, list.length(arr))
}

pub fn main() {
  io.debug(pancake_sort([3, 6, 2, 7, 4, 1, 5]))
}
