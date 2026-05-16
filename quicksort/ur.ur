fun quicksort (lst : list int) : list int =
    case lst of
        [] => []
      | pivot :: rest =>
        let
            val left = List.filter (fn x => x <= pivot) rest
            val right = List.filter (fn x => x > pivot) rest
        in
            List.append (quicksort left) (pivot :: quicksort right)
        end

val result = quicksort [3, 6, 8, 10, 1, 2, 1]
