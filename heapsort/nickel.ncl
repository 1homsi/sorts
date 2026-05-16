let heapify = fun arr n i =>
  let left = 2 * i + 1 in
  let right = 2 * i + 2 in
  let largest0 = if left < n && (std.array.at left arr) > (std.array.at i arr) then left else i in
  let largest = if right < n && (std.array.at right arr) > (std.array.at largest0 arr) then right else largest0 in
  if largest != i then
    let vi = std.array.at i arr in
    let vl = std.array.at largest arr in
    let arr1 = std.array.generate (fun k => if k == i then vl else if k == largest then vi else std.array.at k arr) (std.array.length arr) in
    heapify arr1 n largest
  else arr
in

let heapsort = fun arr =>
  let n = std.array.length arr in
  let arr1 = std.array.fold_right (fun i a => heapify a n i) arr (std.array.generate (fun i => n / 2 - 1 - i) (n / 2)) in
  std.array.fold_right (fun i a =>
    let v0 = std.array.at 0 a in
    let vi = std.array.at i a in
    let a1 = std.array.generate (fun k => if k == 0 then vi else if k == i then v0 else std.array.at k a) n in
    heapify a1 i 0
  ) arr1 (std.array.generate (fun k => n - 1 - k) (n - 1))
in

heapsort [12, 11, 13, 5, 6, 7]
