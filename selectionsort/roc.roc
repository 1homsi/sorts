app "selection-sort" provides [selectionSort] to "./platform"

selectionSort : List I64 -> List I64
selectionSort lst =
    when lst is
        [] -> []
        _ ->
            m = List.min lst |> Result.withDefault 0
            rest = List.dropFirst (List.findFirst lst (\x -> x == m) |> Result.withDefault 0) lst
            List.prepend (selectionSort rest) m
