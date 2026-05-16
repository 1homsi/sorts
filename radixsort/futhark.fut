def get_digit (x: i64) (exp: i64) : i64 = (x / exp) % 10

def counting_sort [n] (arr: [n]i64) (exp: i64) : [n]i64 =
    let buckets = map (\d -> filter (\x -> get_digit x exp == d) arr) (iota 10)
    in flatten_to n (concat_to n buckets (replicate (n - length (flatten buckets)) 0i64))

def radix_sort [n] (arr: [n]i64) : [n]i64 =
    if n == 0 then arr
    else
        let max_val = reduce i64.max 0 arr
        let (result, _) = loop (a, exp) = (arr, 1i64) while max_val / exp > 0 do
            (counting_sort a exp, exp * 10)
        in result

let _ = radix_sort [170i64, 45, 75, 90, 802, 24, 2, 66]
