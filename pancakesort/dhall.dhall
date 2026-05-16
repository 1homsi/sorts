let List/reverse = https://prelude.dhall-lang.org/List/reverse

let flip
    : List Natural -> Natural -> List Natural
    = \(arr : List Natural) -> \(k : Natural) ->
        let front = List/reverse Natural (List/take (k + 1) Natural arr)
        let back = List/drop (k + 1) Natural arr
        in front # back

let findMaxIdx
    : List Natural -> Natural -> Natural
    = \(arr : List Natural) -> \(size : Natural) ->
        let sub = List/take size Natural arr
        in
        (List/indexed Natural sub)
          |> List/fold
               { index : Natural, value : Natural }
               Natural
               (\(x : { index : Natural, value : Natural }) -> \(acc : Natural) ->
                 if Natural/greaterThan x.value (List/index acc Natural sub ? 0)
                 then x.index
                 else acc
               )
               0

in { arr = [3, 6, 2, 7, 4, 1, 5], description = "pancake sort - flip prefix to move max to end" }
