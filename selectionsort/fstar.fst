module SelectionSort

open FStar.List.Tot

let rec selection_sort (lst: list int): Tot (list int) =
  match lst with
  | [] -> []
  | _ ->
    let m = fold_left (fun a b -> if b < a then b else a) (hd lst) lst in
    m :: selection_sort (filter (fun x -> x <> m) lst)
