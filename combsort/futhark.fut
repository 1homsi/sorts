def new_gap (gap: i64) : i64 =
  let g = i64.f64 (f64.i64 gap / 1.3f64)
  in if g < 1 then 1 else g

def comb_sort_pass [n] (arr: *[n]i64) (gap: i64) : (*[n]i64, bool) =
  let (arr', changed) = loop (arr, changed) = (arr, false) for i < n - gap do
    if arr[i] > arr[i + gap] then
      let tmp = arr[i]
      let arr' = arr with [i] = arr[i + gap]
      let arr'' = arr' with [i + gap] = tmp
      in (arr'', true)
    else (arr, changed)
  in (arr', changed)

def comb_sort [n] (arr: *[n]i64) : [n]i64 =
  let gap = n
  let (arr', _) = loop (arr, gap) = (arr, gap) while gap > 1 || true do
    let g = new_gap gap
    let (arr', _changed) = comb_sort_pass arr g
    in (arr', g)
  in arr'
