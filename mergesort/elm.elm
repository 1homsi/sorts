module Main exposing (main)

import Html exposing (text)

mergeList : List Int -> List Int -> List Int
mergeList left right =
    case (left, right) of
        ([], _) -> right
        (_, []) -> left
        (lh :: lt, rh :: rt) ->
            if lh <= rh then
                lh :: mergeList lt right
            else
                rh :: mergeList left rt

mergeSort : List Int -> List Int
mergeSort lst =
    let n = List.length lst
    in
    if n <= 1 then
        lst
    else
        let mid = n // 2
            left = List.take mid lst
            right = List.drop mid lst
        in
        mergeList (mergeSort left) (mergeSort right)

main =
    text (Debug.toString (mergeSort [38, 27, 43, 3, 9, 82, 10]))
