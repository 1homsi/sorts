import gleam/list
import gleam/int
import gleam/io

fn get_digit(x: Int, exp: Int) -> Int {
  int.remainder(x / exp, 10) |> Result.unwrap(0)
}

fn counting_sort(arr: List(Int), exp: Int) -> List(Int) {
  list.range(0, 9)
  |> list.flat_map(fn(d) {
    list.filter(arr, fn(x) { get_digit(x, exp) == d })
  })
}

fn radix_sort_loop(arr: List(Int), max_val: Int, exp: Int) -> List(Int) {
  case max_val / exp {
    0 -> arr
    _ -> radix_sort_loop(counting_sort(arr, exp), max_val, exp * 10)
  }
}

pub fn radix_sort(arr: List(Int)) -> List(Int) {
  case arr {
    [] -> []
    _ -> {
      let max_val = list.fold(arr, 0, int.max)
      radix_sort_loop(arr, max_val, 1)
    }
  }
}

pub fn main() {
  io.debug(radix_sort([170, 45, 75, 90, 802, 24, 2, 66]))
}
