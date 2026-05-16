use aiken/list

fn insert(x: Int, lst: List<Int>) -> List<Int> {
  when lst is {
    [] -> [x]
    [h, ..t] ->
      if x <= h {
        [x, h, ..t]
      } else {
        [h, ..insert(x, t)]
      }
  }
}

pub fn insertion_sort(lst: List<Int>) -> List<Int> {
  when lst is {
    [] -> []
    [h, ..t] -> insert(h, insertion_sort(t))
  }
}
