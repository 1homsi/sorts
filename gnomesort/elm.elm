module GnomeSort exposing (gnomeSort)

import Array exposing (Array)

gnomeSort : Array Int -> Array Int
gnomeSort arr =
    let
        n = Array.length arr
        loop a i =
            if i >= n then
                a
            else if i == 0 then
                loop a (i + 1)
            else
                case (Array.get i a, Array.get (i - 1) a) of
                    (Just x, Just y) ->
                        if x >= y then
                            loop a (i + 1)
                        else
                            loop (a |> Array.set i y |> Array.set (i - 1) x) (i - 1)
                    _ -> a
    in
    loop arr 0
