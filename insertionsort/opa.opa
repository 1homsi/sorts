module InsertionSort

insert(x: int, lst: list(int)): list(int) =
  match lst with
  | [] -> [x]
  | [h | t] -> if x <= h then [x | lst] else [h | insert(x, t)]

insertion_sort(lst: list(int)): list(int) =
  List.fold(insert, [], lst)

end
