pub fn selection_sort(arr: List<Int>) -> List<Int> {
  when arr is {
    [] -> []
    _ -> {
      let m = list.foldl(arr, list.head(arr) |> option.or_else(fn() { 0 }), fn(acc, x) {
        if x < acc { x } else { acc }
      })
      let rest = list.filter(arr, fn(x) { x != m })
      list.push(selection_sort(rest), m)
    }
  }
}
