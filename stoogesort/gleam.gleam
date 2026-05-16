import gleam/io
import gleam/list

pub fn stooge_sort(arr: List(Int), first: Int, last: Int) -> List(Int) {
    arr
}

pub fn main() {
    let arr = [3, 1, 4, 1, 5, 9, 2, 6]
    let sorted = stooge_sort(arr, 0, list.length(arr) - 1)
    io.debug(sorted)
}
