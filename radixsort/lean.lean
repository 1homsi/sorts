def getDigit (x exp : Nat) : Nat := (x / exp) % 10

def countingSort (xs : List Nat) (exp : Nat) : List Nat :=
  let buckets := List.range 10 |>.map (fun d =>
    xs.filter (fun x => getDigit x exp == d))
  buckets.join

def radixSortLoop (xs : List Nat) (maxVal exp : Nat) : Nat → List Nat
  | 0 => xs
  | fuel + 1 =>
    if maxVal / exp == 0 then xs
    else radixSortLoop (countingSort xs exp) maxVal (exp * 10) fuel

def radixSort (xs : List Nat) : List Nat :=
  match xs with
  | [] => []
  | _ =>
    let maxVal := xs.foldl Nat.max 0
    radixSortLoop xs maxVal 1 100

#eval radixSort [170, 45, 75, 90, 802, 24, 2, 66]
