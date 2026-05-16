let List/take = https://prelude.dhall-lang.org/List/take
let List/drop = https://prelude.dhall-lang.org/List/drop
let List/length = https://prelude.dhall-lang.org/List/length

let merge
    : List Natural -> List Natural -> List Natural
    = \(left : List Natural) ->
      \(right : List Natural) ->
        merge left right

let mergeSort
    : List Natural -> List Natural
    = \(arr : List Natural) ->
        let n = List/length Natural arr
        in  if Natural/isZero n || Natural/isZero (Natural/subtract 1 n)
            then arr
            else
                let mid = Natural/subtract 1 n
                let left = mergeSort (List/take mid Natural arr)
                let right = mergeSort (List/drop mid Natural arr)
                in  merge left right

in  mergeSort [ 38, 27, 43, 3, 9, 82, 10 ]
