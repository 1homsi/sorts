def shell_sort [n] (arr: [n]i32) : [n]i32 =
  let a = copy arr
  let gaps = loop (g, gs) = (n / 2, []) while g > 0 do
    (g / 2, gs ++ [g])
  in loop a for gap in gaps[0] do
    loop a for i in gap..(n-1) do
      let temp = a[i]
      let (a, _) = loop (a, j) = (a, i) while j >= gap && a[j - gap] > temp do
        (a with [j] = a[j - gap], j - gap)
      in a with [j] = temp

let main = shell_sort [64i32, 34i32, 25i32, 12i32, 22i32, 11i32, 90i32]
