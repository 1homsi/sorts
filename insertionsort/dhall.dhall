let List/fold = https://prelude.dhall-lang.org/List/fold.dhall

let insert =
      \(x : Natural) ->
      \(lst : List Natural) ->
        List/fold
          Natural
          lst
          (List Natural)
          (\(h : Natural) -> \(acc : List Natural) ->
            if Natural/lessThanEqual x h
            then [x, h] # acc
            else [h] # acc)
          [x]

let insertionSort =
      \(lst : List Natural) ->
        List/fold
          Natural
          lst
          (List Natural)
          (\(x : Natural) -> \(acc : List Natural) -> insert x acc)
          ([] : List Natural)

in insertionSort
