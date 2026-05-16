import gleam/io
import gleam/list
import gleam/int

pub fn compare_and_swap(arr: List(Int), i: Int, j: Int, direction: Bool) -> List(Int) {
  let ai = case list.at(arr, i) { Ok(v) -> v _ -> 0 }
  let aj = case list.at(arr, j) { Ok(v) -> v _ -> 0 }
  case direction == (ai > aj) {
    True -> arr |> list_set(i, aj) |> list_set(j, ai)
    False -> arr
  }
}

fn list_set(lst: List(Int), idx: Int, val: Int) -> List(Int) {
  list.index_map(lst, fn(x, i) { case i == idx { True -> val False -> x } })
}

pub fn bitonic_merge(arr: List(Int), lo: Int, cnt: Int, direction: Bool) -> List(Int) {
  case cnt > 1 {
    False -> arr
    True -> {
      let k = cnt / 2
      let arr2 = list.range(lo, lo + k - 1)
        |> list.fold(arr, fn(a, i) { compare_and_swap(a, i, i + k, direction) })
      arr2 |> bitonic_merge(lo, k, direction) |> bitonic_merge(lo + k, k, direction)
    }
  }
}

pub fn bitonic_sort(arr: List(Int), lo: Int, cnt: Int, direction: Bool) -> List(Int) {
  case cnt > 1 {
    False -> arr
    True -> {
      let k = cnt / 2
      arr
      |> bitonic_sort(lo, k, True)
      |> bitonic_sort(lo + k, k, False)
      |> bitonic_merge(lo, cnt, direction)
    }
  }
}

pub fn main() {
  let data = [3, 7, 4, 8, 6, 2, 1, 5]
  let sorted = bitonic_sort(data, 0, list.length(data), True)
  io.debug(sorted)
}
