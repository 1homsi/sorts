let stooge_sort = fun arr first last =>
    let a = arr |> std.array.at first in
    let b = arr |> std.array.at last in
    let arr = if a > b then
        arr
        |> std.array.update first b
        |> std.array.update last a
    else arr in
    let n = last - first + 1 in
    if n > 2 then
        let t = (n * 2) / 3 in
        let arr = stooge_sort arr first (first + t - 1) in
        let arr = stooge_sort arr (last - t + 1) last in
        stooge_sort arr first (first + t - 1)
    else arr
in

let arr = [3, 1, 4, 1, 5, 9, 2, 6] in
let sorted = stooge_sort arr 0 (std.array.length arr - 1) in
sorted
