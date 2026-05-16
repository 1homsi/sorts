import gleam/list

pub fn gnome_sort(lst: List(Int)) -> List(Int) {
  let arr = list.to_array(lst)
  let n = array.length(arr)
  do_sort(arr, 0, n)
  |> array.to_list
}

fn do_sort(arr, i, n) {
  case i >= n {
    True -> arr
    False ->
      case i == 0 {
        True -> do_sort(arr, i + 1, n)
        False ->
          let a = array.get(arr, i)
          let b = array.get(arr, i - 1)
          case a >= b {
            True -> do_sort(arr, i + 1, n)
            False ->
              let arr2 = array.set(arr, i, b) |> array.set(i - 1, a)
              do_sort(arr2, i - 1, n)
          }
      }
  }
}
