fun merge [] right = right
  | merge left [] = left
  | merge (lh::lt) (rh::rt) =
      if lh <= rh then lh :: merge lt (rh::rt)
      else rh :: merge (lh::lt) rt

fun mergeSort [] = []
  | mergeSort [x] = [x]
  | mergeSort lst =
      let
        val mid = List.length lst div 2
        val left = List.take (lst, mid)
        val right = List.drop (lst, mid)
      in
        merge (mergeSort left) (mergeSort right)
      end

val result = mergeSort [38, 27, 43, 3, 9, 82, 10]
val () = print (String.concatWith " " (map Int.toString result) ^ "\n")
