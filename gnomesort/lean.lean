def gnomeSort (arr : Array Int) : Array Int :=
  let n := arr.size
  let rec loop (a : Array Int) (i : Nat) : Array Int :=
    if i >= n then a
    else if i == 0 || a[i]! >= a[i-1]! then loop a (i + 1)
    else
      let a' := a.swap! i (i - 1)
      loop a' (i - 1)
  loop arr 0
