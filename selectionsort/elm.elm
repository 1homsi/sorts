module SelectionSort exposing (selectionSort)

import List exposing (minimum, filter)

selectionSort : List comparable -> List comparable
selectionSort lst =
    case lst of
        [] -> []
        _ ->
            case minimum lst of
                Nothing -> lst
                Just m ->
                    let rest = removeFirst m lst
                    in m :: selectionSort rest

removeFirst : comparable -> List comparable -> List comparable
removeFirst x lst =
    case lst of
        [] -> []
        y :: ys ->
            if x == y then ys
            else y :: removeFirst x ys
