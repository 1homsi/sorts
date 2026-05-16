type list_int = list(int)

let rec insert = (x: int, lst: list_int): list_int =>
  switch lst {
  | [] => [x]
  | [h, ...t] =>
    if x <= h then [x, h, ...t]
    else [h, ...insert(x, t)]
  }

let rec insertion_sort = (lst: list_int): list_int =>
  switch lst {
  | [] => []
  | [h, ...t] => insert(h, insertion_sort(t))
  }
