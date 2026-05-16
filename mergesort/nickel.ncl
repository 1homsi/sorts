let rec merge = fun left right =>
    if left == [] then right
    else if right == [] then left
    else
        let lh = std.array.first left in
        let rh = std.array.first right in
        let lt = std.array.slice 1 (std.array.length left) left in
        let rt = std.array.slice 1 (std.array.length right) right in
        if lh <= rh then
            [lh] @ (merge lt right)
        else
            [rh] @ (merge left rt)
in

let rec merge_sort = fun arr =>
    let n = std.array.length arr in
    if n <= 1 then arr
    else
        let mid = n / 2 in
        let left = merge_sort (std.array.slice 0 mid arr) in
        let right = merge_sort (std.array.slice mid n arr) in
        merge left right
in

merge_sort [38, 27, 43, 3, 9, 82, 10]
