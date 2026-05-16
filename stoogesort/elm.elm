module Main exposing (main)

import Html exposing (text)
import Array exposing (Array)

stoogeSort : Array Int -> Int -> Int -> Array Int
stoogeSort arr first last =
    let
        a = Maybe.withDefault 0 (Array.get first arr)
        b = Maybe.withDefault 0 (Array.get last arr)
        arr1 = if a > b then
                    arr |> Array.set first b |> Array.set last a
               else arr
        n = last - first + 1
    in
    if n > 2 then
        let t = n * 2 // 3
            arr2 = stoogeSort arr1 first (first + t - 1)
            arr3 = stoogeSort arr2 (last - t + 1) last
        in stoogeSort arr3 first (first + t - 1)
    else arr1

main =
    let arr = Array.fromList [3, 1, 4, 1, 5, 9, 2, 6]
        sorted = stoogeSort arr 0 (Array.length arr - 1)
    in text (Debug.toString sorted)
