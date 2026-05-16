def compare_and_swap [n] (arr: [n]i32) (i: i64) (j: i64) (direction: bool) : [n]i32 =
    let ai = arr[i]
    let aj = arr[j]
    in if direction == (ai > aj)
       then arr with [i] = aj with [j] = ai
       else arr

def bitonic_merge [n] (arr: [n]i32) (lo: i64) (cnt: i64) (direction: bool) : [n]i32 =
    if cnt <= 1 then arr
    else
        let k = cnt / 2
        let arr' = loop a = arr for idx in 0..<k do
            compare_and_swap a (lo + idx) (lo + idx + k) direction
        let arr'' = bitonic_merge arr' lo k direction
        in bitonic_merge arr'' (lo + k) k direction

def bitonic_sort [n] (arr: [n]i32) (lo: i64) (cnt: i64) (direction: bool) : [n]i32 =
    if cnt <= 1 then arr
    else
        let k = cnt / 2
        let arr' = bitonic_sort arr lo k true
        let arr'' = bitonic_sort arr' (lo + k) k false
        in bitonic_merge arr'' lo cnt direction

def main : []i32 =
    let data = [3i32, 7, 4, 8, 6, 2, 1, 5]
    in bitonic_sort data 0 (length data) true
