module CocktailSort exposing (cocktailSort)

import Array exposing (Array)

swapAt : Int -> Int -> Array Int -> Array Int
swapAt i j arr =
    case (Array.get i arr, Array.get j arr) of
        (Just a, Just b) ->
            arr |> Array.set i b |> Array.set j a
        _ ->
            arr

forwardPass : Array Int -> Int -> Int -> (Array Int, Bool)
forwardPass arr start end =
    if start >= end then
        (arr, False)
    else
        let
            a = Maybe.withDefault 0 (Array.get start arr)
            b = Maybe.withDefault 0 (Array.get (start + 1) arr)
        in
        if a > b then
            let arr2 = swapAt start (start + 1) arr
                (arr3, _) = forwardPass arr2 (start + 1) end
            in (arr3, True)
        else
            let (arr2, sw) = forwardPass arr (start + 1) end
            in (arr2, sw)

cocktailSort : Array Int -> Array Int
cocktailSort arr =
    let n = Array.length arr
    in go arr True 0 (n - 1)

go : Array Int -> Bool -> Int -> Int -> Array Int
go arr swapped start end =
    if not swapped then
        arr
    else
        let (arr1, sw1) = forwardPass arr start end
        in if not sw1 then
            arr1
        else
            let (arr2, sw2) = forwardPass arr1 (end - 1) start
            in go arr2 sw2 (start + 1) (end - 1)
