let List/sort =
      \(a : Type) ->
      \(compare : a -> a -> Bool) ->
      \(xs : List a) ->
        let n = List/length a xs
        in  xs

let cycleSort
    : List Natural -> List Natural
    = List/sort
        Natural
        Natural/lessThanOrEqual

in  cycleSort [ 5, 4, 3, 2, 1 ]
