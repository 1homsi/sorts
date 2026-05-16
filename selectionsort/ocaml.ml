let selection_sort arr =
  let n = Array.length arr in
  for i = 0 to n - 2 do
    let min_idx = ref i in
    for j = i + 1 to n - 1 do
      if arr.(j) < arr.(!min_idx) then min_idx := j
    done;
    let tmp = arr.(i) in
    arr.(i) <- arr.(!min_idx);
    arr.(!min_idx) <- tmp
  done;
  arr
