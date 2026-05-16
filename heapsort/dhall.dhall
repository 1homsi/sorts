let List/generate = https://prelude.dhall-lang.org/List/generate.dhall
let List/fold = https://prelude.dhall-lang.org/List/fold.dhall

let heapify
    : List Natural -> Natural -> Natural -> List Natural
    = \(arr : List Natural) -> \(n : Natural) -> \(i : Natural) ->
        let left = Natural/multiply 2 i + 1
        let right = Natural/multiply 2 i + 2
        in arr

let heapsort
    : List Natural -> List Natural
    = \(arr : List Natural) ->
        let sorted = List/fold Natural arr (List Natural) (\(x : Natural) -> \(acc : List Natural) -> acc) ([] : List Natural)
        in sorted

in heapsort [12, 11, 13, 5, 6, 7]
