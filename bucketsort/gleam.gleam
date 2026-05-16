import gleam/list
import gleam/float
import gleam/int
import gleam/io

fn insert_sorted(x: Float, lst: List(Float)) -> List(Float) {
  case lst {
    [] -> [x]
    [h, ..t] ->
      case x <=. h {
        True -> [x, h, ..t]
        False -> [h, ..insert_sorted(x, t)]
      }
  }
}

fn insertion_sort(lst: List(Float)) -> List(Float) {
  case lst {
    [] -> []
    [h, ..t] -> insert_sorted(h, insertion_sort(t))
  }
}

fn get_idx(num: Float, mn: Float, mx: Float, n: Int) -> Int {
  let raw = float.truncate((num -. mn) /. (mx -. mn +. 1.0) *. int.to_float(n))
  int.min(n - 1, raw)
}

fn bucket_sort(arr: List(Float)) -> List(Float) {
  let n = list.length(arr)
  case n {
    0 -> arr
    _ -> {
      let mn = list.fold(arr, list.first(arr) |> result.unwrap(0.0), float.min)
      let mx = list.fold(arr, list.first(arr) |> result.unwrap(0.0), float.max)
      let buckets = list.repeat([], n)
      let filled = list.fold(arr, buckets, fn(bs, x) {
        let idx = get_idx(x, mn, mx, n)
        list.index_map(bs, fn(b, i) {
          case i == idx {
            True -> list.append(b, [x])
            False -> b
          }
        })
      })
      list.flat_map(filled, insertion_sort)
    }
  }
}

pub fn main() {
  let data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
  io.debug(bucket_sort(data))
}
