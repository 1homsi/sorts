import gleam/list

pub fn insert(x: Int, lst: List(Int)) -> List(Int) {
  case lst {
    [] -> [x]
    [h, ..t] ->
      case x <= h {
        True -> [x, h, ..t]
        False -> [h, ..insert(x, t)]
      }
  }
}

pub fn insertion_sort(lst: List(Int)) -> List(Int) {
  case lst {
    [] -> []
    [h, ..t] -> insert(h, insertion_sort(t))
  }
}
