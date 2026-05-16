def newGap (gap : Nat) : Nat :=
  let g := gap * 10 / 13
  if g < 1 then 1 else g

def combSortPass (arr : Array Int) (gap : Nat) : Array Int × Bool :=
  let n := arr.size
  let rec loop (arr : Array Int) (i : Nat) (changed : Bool) : Array Int × Bool :=
    if i + gap >= n then (arr, changed)
    else
      let a := arr[i]!
      let b := arr[i + gap]!
      if a > b then
        let arr' := (arr.set! i b).set! (i + gap) a
        loop arr' (i + 1) true
      else
        loop arr (i + 1) changed
  loop arr 0 false

def combSort (arr : Array Int) : Array Int :=
  let n := arr.size
  let rec loop (arr : Array Int) (gap : Nat) : Array Int :=
    let g := newGap gap
    let (arr', changed) := combSortPass arr g
    if g == 1 && !changed then arr'
    else loop arr' g
  loop arr n
