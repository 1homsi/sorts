def selectionSort (arr : Array Int) : Array Int :=
  let n := arr.size
  let rec loop (arr : Array Int) (i : Nat) : Array Int :=
    if i >= n then arr
    else
      let minIdx := Id.run do
        let mut minIdx := i
        for j in [i+1:n] do
          if arr[j]! < arr[minIdx]! then
            minIdx := j
        return minIdx
      let arr := arr.swap! i minIdx
      loop arr (i + 1)
  loop arr 0
