module Main exposing (..)

import Array exposing (Array)
import Browser
import Html exposing (text)

bubblePass : Array Int -> ( Array Int, Bool )
bubblePass arr =
    let
        n = Array.length arr
        step i ( a, swapped ) =
            if i >= n - 1 then
                ( a, swapped )
            else
                case ( Array.get i a, Array.get (i + 1) a ) of
                    ( Just x, Just y ) ->
                        if x > y then
                            step (i + 1) ( a |> Array.set i y |> Array.set (i + 1) x, True )
                        else
                            step (i + 1) ( a, swapped )
                    _ -> ( a, swapped )
    in
    step 0 ( arr, False )

bubbleSort : Int -> Array Int -> Array Int
bubbleSort fuel arr =
    if fuel <= 0 then arr
    else
        let ( sorted, swapped ) = bubblePass arr
        in if swapped then bubbleSort (fuel - 1) sorted else sorted

main =
    let arr = Array.fromList [ 64, 34, 25, 12, 22, 11, 90 ]
        sorted = bubbleSort 50 arr
    in text (Debug.toString (Array.toList sorted))
