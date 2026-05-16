def bubblePass : List Int → List Int × Bool
  | [] => ([], false)
  | [x] => ([x], false)
  | x :: y :: rest =>
    if x > y then
      let (sorted, _) := bubblePass (x :: rest)
      (y :: sorted, true)
    else
      let (sorted, sw) := bubblePass (y :: rest)
      (x :: sorted, sw)

def bubbleSort (fuel : Nat) (l : List Int) : List Int :=
  match fuel with
  | 0 => l
  | n + 1 =>
    let (sorted, swapped) := bubblePass l
    if swapped then bubbleSort n sorted else sorted

def sort (l : List Int) : List Int :=
  bubbleSort (l.length * l.length) l

#eval sort [64, 34, 25, 12, 22, 11, 90]
