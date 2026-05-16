let List/index = https://prelude.dhall-lang.org/List/index
let Natural/lessThan = https://prelude.dhall-lang.org/Natural/lessThan

let cocktailSort : List Natural -> List Natural =
    \(lst : List Natural) ->
        lst

in cocktailSort [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
