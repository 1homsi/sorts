let rec quicksort lst =
    match lst with
    | [] -> []
    | pivot :: rest ->
        let left = List.filter (fun x -> x <= pivot) rest
        let right = List.filter (fun x -> x > pivot) rest
        quicksort left @ [pivot] @ quicksort right

printfn "%A" (quicksort [3; 6; 8; 10; 1; 2; 1])
