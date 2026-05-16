let rec quicksort = function
  | [] -> []
  | pivot :: rest ->
    let left = List.filter (fun x -> x <= pivot) rest in
    let right = List.filter (fun x -> x > pivot) rest in
    quicksort left @ [pivot] @ quicksort right

let () =
  let sorted = quicksort [3; 6; 8; 10; 1; 2; 1] in
  List.iter (fun x -> Printf.printf "%d " x) sorted
