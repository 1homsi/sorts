let rec merge left right =
  match left, right with
  | [], _ -> right
  | _, [] -> left
  | lh :: lt, rh :: rt ->
    if lh <= rh then lh :: merge lt right
    else rh :: merge left rt

let rec merge_sort lst =
  match lst with
  | [] | [_] -> lst
  | _ ->
    let mid = List.length lst / 2 in
    let left = List.filteri (fun i _ -> i < mid) lst in
    let right = List.filteri (fun i _ -> i >= mid) lst in
    merge (merge_sort left) (merge_sort right)

let () =
  let arr = [38; 27; 43; 3; 9; 82; 10] in
  let sorted = merge_sort arr in
  List.iter (fun x -> print_int x; print_char ' ') sorted;
  print_newline ()
