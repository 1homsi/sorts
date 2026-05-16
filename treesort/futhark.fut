let treesort [n] (arr: [n]i64) : [n]i64 =
  let indexed = zip (iota n) arr
  let sorted = radix_sort_by_key (.1) i64.num_bits i64.get_bit indexed
  map (.1) sorted

let main = treesort [5i64, 3i64, 7i64, 1i64, 4i64, 6i64, 8i64]
