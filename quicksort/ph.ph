fun quicksort(lst) =
  if length(lst) <= 1 then lst
  else let
    val pivot = List.nth(lst, length(lst) div 2)
    val left = List.filter (fn x => x <= pivot) lst
    val right = List.filter (fn x => x > pivot) lst
  in
    quicksort(left) @ [pivot] @ quicksort(right)
  end

val _ = print(String.concatWith " " (map Int.toString (quicksort [3, 6, 8, 10, 1, 2, 1])))
