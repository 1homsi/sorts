selection_sort(arr: list(int)): list(int) =
    match arr with
    | [] -> []
    | _ ->
        m = List.min_def(0, arr)
        rest = List.filter(x -> x != m, arr)
        [m | selection_sort(rest)]
