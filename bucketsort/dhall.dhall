let List/length = https://prelude.dhall-lang.org/List/length
let List/map = https://prelude.dhall-lang.org/List/map
let List/fold = https://prelude.dhall-lang.org/List/fold
let Natural/min = https://prelude.dhall-lang.org/Natural/min

let insertSorted
    : Double -> List Double -> List Double
    = \(x : Double) ->
      \(lst : List Double) ->
        List/fold
          Double
          lst
          (List Double)
          (\(h : Double) -> \(acc : List Double) ->
            if x <= h
            then [x, h] # acc
            else [h] # acc)
          [x]

let insertionSort
    : List Double -> List Double
    = \(lst : List Double) ->
        List/fold
          Double
          lst
          (List Double)
          (\(h : Double) -> \(acc : List Double) -> insertSorted h acc)
          ([] : List Double)

let bucketSort
    : List Double -> List Double
    = \(arr : List Double) ->
        let n = List/length Double arr
        in  mergeMap insertionSort (distributeIntoBuckets arr n)

let data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
in  insertionSort data
