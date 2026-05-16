let minRun = 32;

let rec insertVal = (x, lst) =>
  switch (lst) {
  | [] => [x]
  | [h, ...t] => x <= h ? [x, h, ...t] : [h, ...insertVal(x, t)]
  };

let rec insertionSort = lst =>
  switch (lst) {
  | [] => []
  | [h, ...t] => insertVal(h, insertionSort(t))
  };

let rec mergeRuns = (xs, ys) =>
  switch (xs, ys) {
  | ([], _) => ys
  | (_, []) => xs
  | ([x, ...xrest], [y, ...yrest]) =>
    x <= y ? [x, ...mergeRuns(xrest, ys)] : [y, ...mergeRuns(xs, yrest)]
  };

let rec chunksOf = (n, lst) =>
  switch (lst) {
  | [] => []
  | _ => [Belt.List.take(lst, n) |> Option.value(~default=[]), ...chunksOf(n, Belt.List.drop(lst, n) |> Option.value(~default=[]))]
  };

let rec mergePairs = runs =>
  switch (runs) {
  | [] => []
  | [x] => [x]
  | [x, y, ...rest] => [mergeRuns(x, y), ...mergePairs(rest)]
  };

let rec mergeAll = runs =>
  switch (runs) {
  | [x] => x
  | _ => mergeAll(mergePairs(runs))
  };

let timsort = lst =>
  switch (lst) {
  | [] => lst
  | _ => mergeAll(List.map(insertionSort, chunksOf(minRun, lst)))
  };

let result = timsort([5, 2, 8, 1, 9, 3, 7, 4, 6]);
List.iter(x => Printf.printf("%d ", x), result);
print_newline();
