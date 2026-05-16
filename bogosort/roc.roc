app "bogosort" provides [main] to "./platform"

import List

isSorted : List I64 -> Bool
isSorted = \arr ->
    n = List.len arr
    List.range { start: At 0, end: Before (n - 1) }
    |> List.all \i ->
        a = List.get arr i |> Result.withDefault 0
        b = List.get arr (i + 1) |> Result.withDefault 0
        a <= b

bogosort : List I64 -> List I64
bogosort = \arr ->
    if isSorted arr then arr
    else
        shuffled = List.sortWith arr \a b ->
            if a < b then LT else if a > b then GT else EQ
        bogosort shuffled

main =
    arr = [3, 1, 4, 1, 5, 9, 2, 6]
    result = bogosort arr
    Stdout.line (List.joinWith (List.map result Num.toStr) ", ")
