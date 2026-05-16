def is_sorted [n] (arr: [n]i32) : bool =
  let pairs = zip arr[0:n-1] arr[1:n]
  in all (\(a, b) -> a <= b) pairs

def shuffle [n] (arr: [n]i32) (seed: i32) : [n]i32 =
  let indices = iota n |> map i32.i64
  let swapped = map (\i -> let j = (seed * (i + 1)) % (i32.i64 n) in j) indices
  in scatter (copy arr) (map i64.i32 swapped) (map (\i -> arr[i64.i32 i]) swapped)

def bogosort [n] (arr: [n]i32) : [n]i32 =
  let (_, result) =
    loop (seed, a) = (42i32, arr) while not (is_sorted a) do
      (seed + 1, shuffle a seed)
  in result

let arr: [8]i32 = [3, 1, 4, 1, 5, 9, 2, 6]
let _ = bogosort arr
