import gleam/list

pub fn cocktail_sort(arr: List(Int)) -> List(Int) {
  let indexed = list.index_map(arr, fn(x, i) { #(i, x) })
  do_sort(arr, True, 0, list.length(arr) - 1)
}

fn do_sort(arr: List(Int), swapped: Bool, start: Int, end: Int) -> List(Int) {
  case swapped {
    False -> arr
    True -> {
      let #(arr1, sw1) = forward_pass(arr, start, end, False)
      case sw1 {
        False -> arr1
        True -> {
          let #(arr2, sw2) = backward_pass(arr1, start, end - 1, False)
          do_sort(arr2, sw2, start + 1, end - 1)
        }
      }
    }
  }
}

fn forward_pass(arr: List(Int), i: Int, end: Int, sw: Bool) -> #(List(Int), Bool) {
  case i >= end {
    True -> #(arr, sw)
    False ->
      case list.at(arr, i), list.at(arr, i + 1) {
        Ok(a), Ok(b) if a > b ->
          forward_pass(swap_at(arr, i, i + 1), i + 1, end, True)
        _, _ -> forward_pass(arr, i + 1, end, sw)
      }
  }
}

fn backward_pass(arr: List(Int), start: Int, i: Int, sw: Bool) -> #(List(Int), Bool) {
  case i < start {
    True -> #(arr, sw)
    False ->
      case list.at(arr, i), list.at(arr, i + 1) {
        Ok(a), Ok(b) if a > b ->
          backward_pass(swap_at(arr, i, i + 1), start, i - 1, True)
        _, _ -> backward_pass(arr, start, i - 1, sw)
      }
  }
}

fn swap_at(arr: List(Int), i: Int, j: Int) -> List(Int) {
  let a = case list.at(arr, i) { Ok(x) -> x Error(_) -> 0 }
  let b = case list.at(arr, j) { Ok(x) -> x Error(_) -> 0 }
  list.index_map(arr, fn(x, idx) {
    case idx == i { True -> b False -> case idx == j { True -> a False -> x } }
  })
}
