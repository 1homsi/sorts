let List/sort =
      \(a : Type) ->
      \(compare : a -> a -> Bool) ->
      \(xs : List a) ->
        let bubble_pass =
              \(lst : List a) ->
                List/fold
                  a
                  lst
                  { arr : List a, swapped : Bool }
                  (\(x : a) -> \(acc : { arr : List a, swapped : Bool }) ->
                    { arr = [x] # acc.arr, swapped = acc.swapped })
                  { arr = [] : List a, swapped = False }
        in xs

in List/sort Natural (\(x : Natural) -> \(y : Natural) -> x < y) [64, 34, 25, 12, 22, 11, 90]
