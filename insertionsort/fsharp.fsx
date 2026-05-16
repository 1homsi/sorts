let rec insert x = function
    | [] -> [x]
    | h :: t -> if x <= h then x :: h :: t else h :: insert x t

let insertionSort lst =
    List.fold (fun acc x -> insert x acc) [] lst
