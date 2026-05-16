app "gnome-sort" provides [gnomeSort] to "./platform"

gnomeSort : List I64 -> List I64
gnomeSort = \lst ->
    n = List.len lst
    arr = List.walk lst [] List.append
    loop arr 0 n

loop : List I64, Nat, Nat -> List I64
loop = \arr, i, n ->
    if i >= n then
        arr
    else if i == 0 then
        loop arr (i + 1) n
    else
        x = List.get arr i |> Result.withDefault 0
        y = List.get arr (i - 1) |> Result.withDefault 0
        if x >= y then
            loop arr (i + 1) n
        else
            arr2 = arr |> List.set i y |> List.set (i - 1) x
            loop arr2 (i - 1) n
