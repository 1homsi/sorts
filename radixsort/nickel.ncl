let get_digit = fun x exp => (x / exp) % 10 in

let counting_sort = fun arr exp =>
    std.array.flatten
        (std.array.generate
            (fun d =>
                std.array.filter (fun x => get_digit x exp == d) arr)
            10)
in

let rec radix_sort_loop = fun arr max_val exp =>
    if max_val / exp == 0 then arr
    else radix_sort_loop (counting_sort arr exp) max_val (exp * 10)
in

let radix_sort = fun arr =>
    if arr == [] then arr
    else
        let max_val = std.array.fold_left (fun acc x => if x > acc then x else acc) 0 arr in
        radix_sort_loop arr max_val 1
in

radix_sort [170, 45, 75, 90, 802, 24, 2, 66]
