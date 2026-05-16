let rec quicksort = fun arr =>
  if std.array.length arr <= 1 then arr
  else
    let pivot = std.array.at (std.array.length arr / 2) arr in
    let left = std.array.filter (fun x => x < pivot) arr in
    let middle = std.array.filter (fun x => x == pivot) arr in
    let right = std.array.filter (fun x => x > pivot) arr in
    (quicksort left) @ middle @ (quicksort right)
in

quicksort [3, 6, 8, 10, 1, 2, 1]
