module Main exposing (..)

import List exposing (filter)

quicksort : List comparable -> List comparable
quicksort lst =
    case lst of
        [] ->
            []
        pivot :: rest ->
            let
                left = filter (\x -> x <= pivot) rest
                right = filter (\x -> x > pivot) rest
            in
            quicksort left ++ [ pivot ] ++ quicksort right

main =
    Debug.log "sorted" (quicksort [ 3, 6, 8, 10, 1, 2, 1 ])
