let List/minimum = https://prelude.dhall-lang.org/Natural/min
let selectionSort
    : List Natural -> List Natural
    = \(lst : List Natural) ->
        List/sort Natural lst
in selectionSort [5, 3, 1, 4, 2]
