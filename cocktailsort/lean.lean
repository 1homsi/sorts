def cocktailSortStep (arr : Array Int) : Array Int × Bool :=
  let n := arr.size
  let rec fwd (a : Array Int) (i : Nat) (sw : Bool) : Array Int × Bool :=
    if i + 1 >= n then (a, sw)
    else if a[i]! > a[i+1]! then
      let a' := a.swap! i (i+1)
      fwd a' (i+1) true
    else fwd a (i+1) sw
  let (arr1, sw1) := fwd arr 0 false
  if !sw1 then (arr1, false)
  else
    let rec bwd (a : Array Int) (i : Nat) (sw : Bool) : Array Int × Bool :=
      if i == 0 then (a, sw)
      else if a[i-1]! > a[i]! then
        let a' := a.swap! (i-1) i
        bwd a' (i-1) true
      else bwd a (i-1) sw
    bwd arr1 (n-1) false

def cocktailSort (arr : Array Int) : Array Int :=
  let rec go (a : Array Int) (fuel : Nat) : Array Int :=
    match fuel with
    | 0 => a
    | n+1 =>
      let (a', sw) := cocktailSortStep a
      if sw then go a' n else a'
  go arr (arr.size * arr.size)
