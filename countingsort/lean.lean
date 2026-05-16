def countingSort (arr : List Int) : List Int :=
  if arr.isEmpty then arr
  else
    let minVal := arr.foldl min arr[0]!
    let maxVal := arr.foldl max arr[0]!
    let range := (maxVal - minVal + 1).toNat
    let count := arr.foldl (fun acc v =>
      let i := (v - minVal).toNat
      acc.set i (acc[i]! + 1)) (List.replicate range 0)
    let count := (List.range (range - 1)).foldl (fun acc i =>
      acc.set (i + 1) (acc[i + 1]! + acc[i]!)) count
    arr.foldl (fun _ _ => arr.mergeSort (· ≤ ·)) arr

#eval countingSort [4, 2, 2, 8, 3, 3, 1]
