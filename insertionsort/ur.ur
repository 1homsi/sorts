fun insertSorted (x : int) (lst : list int) : list int =
    case lst of
        [] => [x]
      | h :: t =>
        if x <= h then x :: h :: t
        else h :: insertSorted x t

fun insertionSort (lst : list int) : list int =
    List.foldl insertSorted [] lst
