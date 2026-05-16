fun quicksort [] = []
  | quicksort (pivot::rest) =
      let
        val left = List.filter (fn x => x <= pivot) rest
        val right = List.filter (fn x => x > pivot) rest
      in
        quicksort left @ [pivot] @ quicksort right
      end

val _ = print (String.concatWith " " (map Int.toString (quicksort [3, 6, 8, 10, 1, 2, 1])) ^ "\n")
