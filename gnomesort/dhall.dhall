let List/index = https://prelude.dhall-lang.org/List/index.dhall

let gnomeSort
    : List Natural -> List Natural
    = \(lst : List Natural) ->
        lst

in gnomeSort [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
