let minRun = 32

let rec insertVal = (x, lst) =>
  switch lst {
  | list{} => list{x}
  | list{h, ...t} => x <= h ? list{x, h, ...t} : list{h, ...insertVal(x, t)}
  }

let rec insertionSort = lst =>
  switch lst {
  | list{} => list{}
  | list{h, ...t} => insertVal(h, insertionSort(t))
  }

let rec mergeRuns = (xs, ys) =>
  switch (xs, ys) {
  | (list{}, _) => ys
  | (_, list{}) => xs
  | (list{x, ...xrest}, list{y, ...yrest}) =>
    x <= y ? list{x, ...mergeRuns(xrest, ys)} : list{y, ...mergeRuns(xs, yrest)}
  }

let rec chunksOf = (n, lst) =>
  switch lst {
  | list{} => list{}
  | _ =>
    let chunk = Belt.List.take(lst, n)->Option.getOr(list{})
    let rest = Belt.List.drop(lst, n)->Option.getOr(list{})
    list{chunk, ...chunksOf(n, rest)}
  }

let rec mergePairs = runs =>
  switch runs {
  | list{} => list{}
  | list{x} => list{x}
  | list{x, y, ...rest} => list{mergeRuns(x, y), ...mergePairs(rest)}
  }

let rec mergeAll = runs =>
  switch runs {
  | list{x} => x
  | _ => mergeAll(mergePairs(runs))
  }

let timsort = lst =>
  switch lst {
  | list{} => lst
  | _ => mergeAll(Belt.List.map(chunksOf(minRun, lst), insertionSort))
  }

let result = timsort(list{5, 2, 8, 1, 9, 3, 7, 4, 6})
Belt.List.forEach(result, x => Js.log2(x, ""))
