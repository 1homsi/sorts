import gleam/list
import gleam/int
import gleam/io

const min_run = 32

fn insert_val(x: Int, lst: List(Int)) -> List(Int) {
  case lst {
    [] -> [x]
    [h, ..t] ->
      case x <= h {
        True -> [x, h, ..t]
        False -> [h, ..insert_val(x, t)]
      }
  }
}

fn insertion_sort(lst: List(Int)) -> List(Int) {
  case lst {
    [] -> []
    [h, ..t] -> insert_val(h, insertion_sort(t))
  }
}

fn merge_runs(xs: List(Int), ys: List(Int)) -> List(Int) {
  case xs, ys {
    [], _ -> ys
    _, [] -> xs
    [x, ..xrest], [y, ..yrest] ->
      case x <= y {
        True -> [x, ..merge_runs(xrest, ys)]
        False -> [y, ..merge_runs(xs, yrest)]
      }
  }
}

fn chunks_of(n: Int, lst: List(Int)) -> List(List(Int)) {
  case lst {
    [] -> []
    _ -> [list.take(lst, n), ..chunks_of(n, list.drop(lst, n))]
  }
}

fn merge_pairs(runs: List(List(Int))) -> List(List(Int)) {
  case runs {
    [] -> []
    [x] -> [x]
    [x, y, ..rest] -> [merge_runs(x, y), ..merge_pairs(rest)]
  }
}

fn merge_all(runs: List(List(Int))) -> List(Int) {
  case runs {
    [] -> []
    [x] -> x
    _ -> merge_all(merge_pairs(runs))
  }
}

pub fn timsort(lst: List(Int)) -> List(Int) {
  case lst {
    [] -> lst
    _ ->
      lst
      |> chunks_of(min_run, _)
      |> list.map(insertion_sort)
      |> merge_all
  }
}

pub fn main() {
  let sorted = timsort([5, 2, 8, 1, 9, 3, 7, 4, 6])
  io.debug(sorted)
}
