def flip (arr : Array Int) (k : Nat) : Array Int :=
  let rec go (a : Array Int) (l r : Nat) : Array Int :=
    if l < r then
      let tmp := a[l]!
      let a' := a.set! l a[r]!
      let a'' := a'.set! r tmp
      go a'' (l + 1) (r - 1)
    else a
  go arr 0 k

def findMaxIdx (arr : Array Int) (size : Nat) : Nat :=
  let rec go (i maxIdx : Nat) : Nat :=
    if i >= size then maxIdx
    else if arr[i]! > arr[maxIdx]! then go (i + 1) i
    else go (i + 1) maxIdx
  go 1 0

def pancakeSort (arr : Array Int) : Array Int :=
  let rec go (a : Array Int) (size : Nat) : Array Int :=
    if size <= 1 then a
    else
      let maxIdx := findMaxIdx a size
      let a1 := if maxIdx != size - 1 then
        let a' := if maxIdx != 0 then flip a maxIdx else a
        flip a' (size - 1)
      else a
      go a1 (size - 1)
  go arr arr.size

#eval pancakeSort #[3, 6, 2, 7, 4, 1, 5]
