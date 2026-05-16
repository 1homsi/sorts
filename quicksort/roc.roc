app "quicksort" provides [main] to "./platform"

quicksort : List I64 -> List I64
quicksort = \lst ->
    if List.len lst <= 1 then
        lst
    else
        pivot = List.get lst (List.len lst // 2) |> Result.withDefault 0
        left = List.keepIf lst \x -> x < pivot
        middle = List.keepIf lst \x -> x == pivot
        right = List.keepIf lst \x -> x > pivot
        List.concat (List.concat (quicksort left) middle) (quicksort right)

main =
    result = quicksort [3, 6, 8, 10, 1, 2, 1]
    Stdout.line (Inspect.toStr result)
