module Quicksort

open FStar.List.Tot

let rec quicksort (#a:eqtype) (cmp: a -> a -> bool) (lst: list a) : list a =
    match lst with
    | [] -> []
    | pivot :: rest ->
        let left = filter (fun x -> cmp x pivot) rest in
        let right = filter (fun x -> not (cmp x pivot) && not (x = pivot)) rest in
        let middle = filter (fun x -> x = pivot) rest in
        (quicksort cmp left) @ [pivot] @ (quicksort cmp right)

let result = quicksort (fun x y -> x <= y) [3; 6; 8; 10; 1; 2; 1]
