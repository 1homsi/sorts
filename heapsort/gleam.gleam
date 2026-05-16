import gleam/io
import gleam/list
import gleam/int

fn get(arr: List(Int), i: Int) -> Int {
  case list.drop(arr, i) {
    [x, ..] -> x
    [] -> 0
  }
}

fn set(arr: List(Int), i: Int, v: Int) -> List(Int) {
  list.index_map(arr, fn(x, idx) { if idx == i { v } else { x } })
}

fn swap(arr: List(Int), i: Int, j: Int) -> List(Int) {
  let vi = get(arr, i)
  let vj = get(arr, j)
  arr |> set(i, vj) |> set(j, vi)
}

fn heapify(arr: List(Int), n: Int, i: Int) -> List(Int) {
  let left = 2 * i + 1
  let right = 2 * i + 2
  let largest0 = case left < n && get(arr, left) > get(arr, i) {
    True -> left
    False -> i
  }
  let largest = case right < n && get(arr, right) > get(arr, largest0) {
    True -> right
    False -> largest0
  }
  case largest != i {
    True -> heapify(swap(arr, i, largest), n, largest)
    False -> arr
  }
}

fn build_heap(arr: List(Int), n: Int, i: Int) -> List(Int) {
  case i < 0 {
    True -> arr
    False -> build_heap(heapify(arr, n, i), n, i - 1)
  }
}

fn sort_step(arr: List(Int), i: Int) -> List(Int) {
  case i <= 0 {
    True -> arr
    False ->
      arr
      |> swap(0, i)
      |> heapify(i, 0)
      |> sort_step(i - 1)
  }
}

pub fn heapsort(lst: List(Int)) -> List(Int) {
  let n = list.length(lst)
  lst
  |> build_heap(n, n / 2 - 1)
  |> sort_step(n - 1)
}

pub fn main() {
  [12, 11, 13, 5, 6, 7]
  |> heapsort
  |> io.debug
}
