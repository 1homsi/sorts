let rec insert x = function
  | [] -> [x]
  | h :: t -> if x <= h then x :: h :: t else h :: insert x t

let insertion_sort lst =
  List.fold_left (fun acc x -> insert x acc) [] lst
