def compareAndSwap (arr : Array Int) (i j : Nat) (direction : Bool) : Array Int :=
  if direction == (arr[i]! > arr[j]!) then
    arr.set! i arr[j]! |>.set! j arr[i]!
  else
    arr

def bitonicMerge (arr : Array Int) (lo cnt : Nat) (direction : Bool) : Array Int :=
  if cnt <= 1 then arr
  else
    let k := cnt / 2
    let arr' := (List.range k).foldl (fun a idx =>
      compareAndSwap a (lo + idx) (lo + idx + k) direction) arr
    let arr'' := bitonicMerge arr' lo k direction
    bitonicMerge arr'' (lo + k) k direction
termination_by cnt

def bitonicSort (arr : Array Int) (lo cnt : Nat) (direction : Bool) : Array Int :=
  if cnt <= 1 then arr
  else
    let k := cnt / 2
    let arr' := bitonicSort arr lo k true
    let arr'' := bitonicSort arr' (lo + k) k false
    bitonicMerge arr'' lo cnt direction
termination_by cnt

def main : IO Unit := do
  let data : Array Int := #[3, 7, 4, 8, 6, 2, 1, 5]
  let sorted := bitonicSort data 0 data.size true
  IO.println s!"{sorted.toList}"
