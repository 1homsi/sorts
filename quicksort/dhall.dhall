let List/filter = https://prelude.dhall-lang.org/List/filter
let Natural/lessThan = https://prelude.dhall-lang.org/Natural/lessThan

let quicksort
    : List Natural -> List Natural
    = \(lst : List Natural) ->
        let go = \(xs : List Natural) ->
          merge
            { None = [] : List Natural
            , Some = \(pivot : Natural) ->
                let rest = List/drop 1 Natural xs
                let left = List/filter Natural (\(x : Natural) -> Natural/lessThan x pivot) rest
                let right = List/filter Natural (\(x : Natural) -> Natural/lessThan pivot x) rest
                in go left # [pivot] # go right
            }
            (List/head Natural xs)
        in go lst

in quicksort [3, 6, 8, 10, 1, 2, 1]
