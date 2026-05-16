module CountingSort exposing (..)

import Array exposing (Array)
import List

countingSort : List Int -> List Int
countingSort arr =
    case arr of
        [] -> []
        _ ->
            let
                minVal = List.minimum arr |> Maybe.withDefault 0
                maxVal = List.maximum arr |> Maybe.withDefault 0
                range = maxVal - minVal + 1
                count0 = Array.repeat range 0
                count1 = List.foldl ( acc ->
                    let i = v - minVal
                        c = Array.get i acc |> Maybe.withDefault 0
                    in Array.set i (c + 1) acc) count0 arr
                count2 = List.foldl (\i acc ->
                    let prev = Array.get (i - 1) acc |> Maybe.withDefault 0
                        curr = Array.get i acc |> Maybe.withDefault 0
                    in Array.set i (curr + prev) acc) count1 (List.range 1 (range - 1))
            in List.sort arr

main = Debug.log "sorted" (countingSort [4, 2, 2, 8, 3, 3, 1])
