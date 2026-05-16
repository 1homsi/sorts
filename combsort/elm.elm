module CombSort exposing (combSort)

import Array exposing (Array, get, set, length)

combSort : Array Int -> Array Int
combSort arr =
    let
        n = length arr
    in
    loop arr n

loop : Array Int -> Int -> Array Int
loop arr gap =
    let
        g = max 1 (floor (toFloat gap / 1.3))
        (arr2, changed) = pass arr g 0 False
    in
    if g == 1 && not changed then
        arr2
    else
        loop arr2 g

pass : Array Int -> Int -> Int -> Bool -> (Array Int, Bool)
pass arr gap i changed =
    let n = length arr in
    if i + gap >= n then
        (arr, changed)
    else
        case (get i arr, get (i + gap) arr) of
            (Just ai, Just aj) ->
                if ai > aj then
                    let arr2 = set i aj (set (i + gap) ai arr)
                    in pass arr2 gap (i + 1) True
                else
                    pass arr gap (i + 1) changed
            _ ->
                pass arr gap (i + 1) changed
