-- Nomad is a functional database query language.
-- Merge sort expressed in functional style.

let merge left right =
    match left, right with
    | [], r -> r
    | l, [] -> l
    | (lh::lt), (rh::rt) ->
        if lh <= rh then lh :: merge lt right
        else rh :: merge left rt

let rec mergeSort lst =
    let n = List.length lst in
    if n <= 1 then lst
    else
        let mid = n / 2 in
        merge
            (mergeSort (List.take mid lst))
            (mergeSort (List.drop mid lst))

query: mergeSort [38; 27; 43; 3; 9; 82; 10]
