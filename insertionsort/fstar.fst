module InsertionSort

open FStar.List.Tot

let rec insert (x: int) (lst: list int) : list int =
  match lst with
  | [] -> [x]
  | h :: t -> if x <= h then x :: h :: t else h :: insert x t

let rec insertion_sort (lst: list int) : list int =
  match lst with
  | [] -> []
  | h :: t -> insert h (insertion_sort t)
