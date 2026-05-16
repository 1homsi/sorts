let List/take = https://prelude.dhall-lang.org/List/take
let List/drop = https://prelude.dhall-lang.org/List/drop
let Natural/lessThanEqual = https://prelude.dhall-lang.org/Natural/lessThanEqual

let min_run = 32

let insertVal
    : Natural -> List Natural -> List Natural
    = \(x : Natural) -> \(lst : List Natural) ->
        merge Natural
          { index = 0, value = x }
          lst
          (\(i : Natural) -> \(v : Natural) -> Natural/lessThanEqual x v)

let insertionSort
    : List Natural -> List Natural
    = \(lst : List Natural) ->
        List/fold Natural lst (List Natural)
          (\(x : Natural) -> \(acc : List Natural) -> insertVal x acc)
          ([] : List Natural)

let chunksOf
    : Natural -> List Natural -> List (List Natural)
    = \(n : Natural) -> \(lst : List Natural) ->
        let len = List/length Natural lst in
        List/generate
          (Natural/divide n len + 1)
          (List Natural)
          (\(i : Natural) ->
            List/take Natural n (List/drop Natural (Natural/multiply i n) lst))

let mergeTwo
    : List Natural -> List Natural -> List Natural
    = \(xs : List Natural) -> \(ys : List Natural) ->
        insertionSort (xs # ys)

let timsort
    : List Natural -> List Natural
    = \(lst : List Natural) ->
        let chunks = chunksOf min_run lst
        let sorted_chunks = List/map (List Natural) (List Natural) insertionSort chunks
        in List/fold (List Natural) sorted_chunks (List Natural)
             (\(run : List Natural) -> \(acc : List Natural) -> mergeTwo run acc)
             ([] : List Natural)

in timsort [5, 2, 8, 1, 9, 3, 7, 4, 6]
