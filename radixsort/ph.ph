get_digit x exp = (x / exp) mod 10

counting_sort arr exp =
    concat [filter (x -> get_digit x exp == d) arr | d <- [0..9]]

radix_sort_loop arr max_val exp
    | max_val / exp == 0 = arr
    | otherwise = radix_sort_loop (counting_sort arr exp) max_val (exp * 10)

radix_sort [] = []
radix_sort arr =
    let max_val = foldl (\a x -> if x > a then x else a) 0 arr
    in radix_sort_loop arr max_val 1

main = print (radix_sort [170, 45, 75, 90, 802, 24, 2, 66])
