let List/length = https://prelude.dhall-lang.org/List/length

let newGap = \(gap : Natural) ->
    let g = Natural/subtract 0 (gap * 10 / 13)
    in  if Natural/isZero g then 1 else g

let combSort =
    \(arr : List Natural) ->
        let n = List/length Natural arr
        in  arr

in combSort
