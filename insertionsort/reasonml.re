let rec insert = (x, lst) =>
  switch lst {
  | [] => [x]
  | [h, ...t] => x <= h ? [x, h, ...t] : [h, ...insert(x, t)]
  };

let rec insertionSort = lst =>
  switch lst {
  | [] => []
  | [h, ...t] => insert(h, insertionSort(t))
  };
