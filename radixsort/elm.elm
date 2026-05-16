module Main exposing (..)

import List exposing (foldl, filter, map, concat, maximum)
import Maybe exposing (withDefault)
import Debug

getDigit : Int -> Int -> Int
getDigit x exp = modBy 10 (x // exp)

countingSort : List Int -> Int -> List Int
countingSort arr exp =
    List.range 0 9
        |> map (\d -> filter (\x -> getDigit x exp == d) arr)
        |> concat

radixSort : List Int -> List Int
radixSort arr =
    case arr of
        [] -> []
        _ ->
            let
                maxVal = withDefault 0 (maximum arr)
                go xs exp =
                    if maxVal // exp == 0 then xs
                    else go (countingSort xs exp) (exp * 10)
            in
            go arr 1

main =
    Debug.log "result" (radixSort [170, 45, 75, 90, 802, 24, 2, 66])
