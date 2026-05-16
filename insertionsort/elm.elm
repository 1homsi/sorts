module InsertionSort exposing (insertionSort)

insert : Int -> List Int -> List Int
insert x lst =
    case lst of
        [] -> [ x ]
        y :: ys ->
            if x <= y then
                x :: y :: ys
            else
                y :: insert x ys

insertionSort : List Int -> List Int
insertionSort lst =
    case lst of
        [] -> []
        x :: xs -> insert x (insertionSort xs)
