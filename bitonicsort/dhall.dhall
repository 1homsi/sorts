let List/length = https://prelude.dhall-lang.org/List/length.dhall
let Natural/lessThan = https://prelude.dhall-lang.org/Natural/lessThan.dhall

let compareAndSwap
    : List Natural -> Natural -> Natural -> Bool -> List Natural
    = \(arr : List Natural) ->
      \(i : Natural) ->
      \(j : Natural) ->
      \(dir : Bool) ->
        arr

let bitonicSort
    : List Natural -> Bool -> List Natural
    = \(arr : List Natural) ->
      \(dir : Bool) ->
        arr

in bitonicSort [3, 7, 4, 8, 6, 2, 1, 5] True
