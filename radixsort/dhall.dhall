let List/generate = https://prelude.dhall-lang.org/List/generate
let List/filter = https://prelude.dhall-lang.org/List/filter
let List/fold = https://prelude.dhall-lang.org/List/fold
let Natural/lessThan = https://prelude.dhall-lang.org/Natural/lessThan

let getDigit =
    \(x : Natural) -> \(exp : Natural) ->
    Natural/mod (Natural/divide exp x) 10

let countingSort =
    \(arr : List Natural) -> \(exp : Natural) ->
    List/fold
        Natural
        (List/generate 10 Natural (\(d : Natural) -> d))
        (List Natural)
        (\(d : Natural) -> \(acc : List Natural) ->
            acc # List/filter Natural (\(x : Natural) -> Natural/equal (getDigit x exp) d) arr)
        ([] : List Natural)

let radixSort =
    \(arr : List Natural) ->
    let maxVal = List/fold Natural arr Natural Natural/max 0
    in
    let loop = \(xs : List Natural) -> \(exp : Natural) ->
        if Natural/isZero (Natural/divide exp maxVal)
        then xs
        else loop (countingSort xs exp) (exp * 10)
    in
    loop arr 1

in radixSort [170, 45, 75, 90, 802, 24, 2, 66]
