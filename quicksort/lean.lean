def quicksort : List Int → List Int
  | [] => []
  | pivot :: rest =>
    let left := rest.filter (· ≤ pivot)
    let right := rest.filter (· > pivot)
    quicksort left ++ [pivot] ++ quicksort right

#eval quicksort [3, 6, 8, 10, 1, 2, 1]
