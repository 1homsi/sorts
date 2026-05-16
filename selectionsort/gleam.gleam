import gleam/list
import gleam/order

pub fn selection_sort(lst: List(Int)) -> List(Int) {
  case lst {
    [] -> []
    _ -> {
      let min = list.fold(lst, list.first(lst) |> Result.unwrap(0), fn(acc, x) {
        case x < acc {
          True -> x
          False -> acc
        }
      })
      let rest = remove_first(min, lst)
      [min, ..selection_sort(rest)]
    }
  }
}

fn remove_first(x: Int, lst: List(Int)) -> List(Int) {
  case lst {
    [] -> []
    [h, ..t] -> case h == x {
      True -> t
      False -> [h, ..remove_first(x, t)]
    }
  }
}
