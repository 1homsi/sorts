let insertSorted = (x, lst) => {
  let rec go = lst =>
    switch lst {
    | [] => [x]
    | [h, ...t] => x <= h ? [x, h, ...t] : [h, ...go(t)]
    };
  go(lst);
};

let insertionSort = lst => {
  let rec go = lst =>
    switch lst {
    | [] => []
    | [h, ...t] => insertSorted(h, go(t))
    };
  go(lst);
};

let getIdx = (num, mn, mx, n) => {
  let raw = int_of_float((num -. mn) /. (mx -. mn +. 1.0) *. float_of_int(n));
  min(n - 1, raw);
};

let bucketSort = arr => {
  let n = List.length(arr);
  if (n == 0) {
    arr;
  } else {
    let mn = List.fold_left(min, List.hd(arr), arr);
    let mx = List.fold_left(max, List.hd(arr), arr);
    let buckets = Array.make(n, []);
    List.iter(num => {
      let idx = getIdx(num, mn, mx, n);
      buckets[idx] = buckets[idx] @ [num];
    }, arr);
    Array.fold_left((acc, b) => acc @ insertionSort(b), [], buckets);
  };
};

let data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
let sorted = bucketSort(data);
List.iter(x => print_string(string_of_float(x) ++ " "), sorted);
print_newline();
