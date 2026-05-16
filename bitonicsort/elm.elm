module BitonicSort exposing (main)

import Array exposing (Array)
import Html exposing (text)

compareAndSwap : Array Int -> Int -> Int -> Bool -> Array Int
compareAndSwap arr i j direction =
    let
        ai = Maybe.withDefault 0 (Array.get i arr)
        aj = Maybe.withDefault 0 (Array.get j arr)
    in
    if direction == (ai > aj) then
        arr |> Array.set i aj |> Array.set j ai
    else
        arr

bitonicMerge : Array Int -> Int -> Int -> Bool -> Array Int
bitonicMerge arr lo cnt direction =
    if cnt <= 1 then
        arr
    else
        let
            k = cnt // 2
            arr1 = List.foldl (\i a -> compareAndSwap a i (i + k) direction) arr (List.range lo (lo + k - 1))
            arr2 = bitonicMerge arr1 lo k direction
        in
        bitonicMerge arr2 (lo + k) k direction

bitonicSort : Array Int -> Int -> Int -> Bool -> Array Int
bitonicSort arr lo cnt direction =
    if cnt <= 1 then
        arr
    else
        let
            k = cnt // 2
            arr1 = bitonicSort arr lo k True
            arr2 = bitonicSort arr1 (lo + k) k False
        in
        bitonicMerge arr2 lo cnt direction

main =
    let
        data_ = Array.fromList [ 3, 7, 4, 8, 6, 2, 1, 5 ]
        sorted = bitonicSort data_ 0 (Array.length data_) True
    in
    text (Debug.toString (Array.toList sorted))
