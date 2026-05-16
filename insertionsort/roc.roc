app "InsertionSort" provides [insertionSort] to "./platform"

insert : I64, List I64 -> List I64
insert = \x, lst ->
    when lst is
        [] -> [x]
        [h, ..rest] ->
            if x <= h then
                List.prepend [h, ..rest] x
            else
                List.prepend (insert x rest) h

insertionSort : List I64 -> List I64
insertionSort = \lst ->
    when lst is
        [] -> []
        [h, ..rest] -> insert h (insertionSort rest)
