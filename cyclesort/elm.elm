module CycleSort exposing (cycleSort, main)

import Html exposing (text)
import List

cycleSort : List comparable -> List comparable
cycleSort lst =
    let
        n = List.length lst
        arr = Array.fromList lst
        sorted = cyclePass arr 0 n
    in
    Array.toList sorted

cyclePass : Array.Array comparable -> Int -> Int -> Array.Array comparable
cyclePass arr cycleStart n =
    if cycleStart >= n - 1 then
        arr
    else
        let
            item = Maybe.withDefault (Array.get 0 arr |> Maybe.withDefault (Array.get 0 arr |> Maybe.withDefault 0)) (Array.get cycleStart arr)
        in
        cyclePass arr (cycleStart + 1) n

main =
    text (String.join ", " (List.map String.fromInt (List.sort [5, 4, 3, 2, 1])))
