let gnome_sort = fun arr =>
  let n = std.array.length arr in
  let rec loop = fun a i =>
    if i >= n then a
    else if i == 0 || std.array.at i a >= std.array.at (i - 1) a then
      loop a (i + 1)
    else
      let x = std.array.at i a in
      let y = std.array.at (i - 1) a in
      let a' = std.array.update i y (std.array.update (i - 1) x a) in
      loop a' (i - 1)
  in
  loop arr 0
in
gnome_sort [5, 3, 8, 1, 9, 2, 7]
