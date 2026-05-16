import gleam/list
import gleam/int
import gleam/float

pub fn comb_sort(arr: List(Int)) -> List(Int) {
  let n = list.length(arr)
  do_sort(arr, n, n)
}

fn new_gap(gap: Int) -> Int {
  let g = float.floor(int.to_float(gap) /. 1.3) |> float.round
  case g < 1 {
    True -> 1
    False -> g
  }
}

fn do_sort(arr: List(Int), n: Int, gap: Int) -> List(Int) {
  let g = new_gap(gap)
  let #(arr2, changed) = pass(arr, g, 0, n, False)
  case g == 1 && !changed {
    True -> arr2
    False -> do_sort(arr2, n, g)
  }
}

fn pass(arr: List(Int), gap: Int, i: Int, n: Int, changed: Bool) -> #(List(Int), Bool) {
  case i + gap >= n {
    True -> #(arr, changed)
    False ->
      case list.at(arr, i), list.at(arr, i + gap) {
        Ok(a), Ok(b) if a > b ->
          pass(swap(arr, i, i + gap), gap, i + 1, n, True)
        _, _ -> pass(arr, gap, i + 1, n, changed)
      }
  }
}

fn swap(arr: List(Int), i: Int, j: Int) -> List(Int) {
  arr
}
