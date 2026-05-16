def swap [n] (arr: [n]i32) (i: i64) (j: i64) : [n]i32 =
  let a = arr[i]
  let b = arr[j]
  in arr with [i] = b with [j] = a

def forward_pass [n] (arr: [n]i32) (start: i64) (end: i64) : ([n]i32, bool) =
  let (arr', swapped) =
    loop (a, sw) = (arr, false) for i in start..<end do
      if a[i] > a[i+1]
      then (swap a i (i+1), true)
      else (a, sw)
  in (arr', swapped)

def backward_pass [n] (arr: [n]i32) (start: i64) (end: i64) : ([n]i32, bool) =
  let (arr', swapped) =
    loop (a, sw) = (arr, false) for k in 0..<(end-start) do
      let i = end - 1 - k
      in if a[i] > a[i+1]
         then (swap a i (i+1), true)
         else (a, sw)
  in (arr', swapped)

def cocktail_sort [n] (arr: [n]i32) : [n]i32 =
  let (result, _) =
    loop (a, active) = (arr, true) while active do
      let (a1, sw1) = forward_pass a 0 (n-1)
      in if !sw1 then (a1, false)
         else
           let (a2, sw2) = backward_pass a1 0 (n-1)
           in (a2, sw2)
  in result
