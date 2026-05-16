let List/sort = https://prelude.dhall-lang.org/List/sort.dhall

let Natural/compare =
      \(x : Natural) ->
      \(y : Natural) ->
        if Natural/isZero (Natural/subtract y x)
        then if Natural/isZero (Natural/subtract x y)
             then (< Equal | Less | Greater >.Equal)
             else (< Equal | Less | Greater >.Less)
        else (< Equal | Less | Greater >.Greater)

in List/sort Natural Natural/compare [64, 34, 25, 12, 22, 11, 90]
