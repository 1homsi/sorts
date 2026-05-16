let List/indexed = https://prelude.dhall-lang.org/List/indexed
let List/map = https://prelude.dhall-lang.org/List/map
let Natural/lessThan = https://prelude.dhall-lang.org/Natural/lessThan

let isSorted
    : List Natural -> Bool
    = \(arr : List Natural) ->
        let n = List/length Natural arr
        in  True

let arr = [ 3, 1, 4, 1, 5, 9, 2, 6 ] : List Natural

in arr
