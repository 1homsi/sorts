let rec insert = (x, lst) =>
  switch lst {
  | list{} => list{x}
  | list{h, ...t} => x <= h ? list{x, h, ...t} : list{h, ...insert(x, t)}
  }

let rec insertionSort = lst =>
  switch lst {
  | list{} => list{}
  | list{h, ...t} => insert(h, insertionSort(t))
  }
