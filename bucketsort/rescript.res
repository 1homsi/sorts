let insertSorted = (x, lst) => {
  let rec go = lst =>
    switch lst {
    | list{} => list{x}
    | list{h, ...t} => x <= h ? list{x, h, ...t} : list{h, ...go(t)}
    }
  go(lst)
}

let insertionSort = lst => {
  let rec go = lst =>
    switch lst {
    | list{} => list{}
    | list{h, ...t} => insertSorted(h, go(t))
    }
  go(lst)
}

let getIdx = (num, mn, mx, n) => {
  let raw = int_of_float((num -. mn) /. (mx -. mn +. 1.0) *. float_of_int(n))
  min(n - 1, raw)
}

let bucketSort = arr => {
  let n = Belt.List.length(arr)
  if n == 0 {
    arr
  } else {
    let mn = Belt.List.reduce(arr, Belt.List.headExn(arr), min)
    let mx = Belt.List.reduce(arr, Belt.List.headExn(arr), max)
    let buckets = Belt.Array.make(n, list{})
    Belt.List.forEach(arr, num => {
      let idx = getIdx(num, mn, mx, n)
      buckets[idx] = Belt.List.concat(buckets[idx], list{num})
    })
    Belt.Array.reduce(buckets, list{}, (acc, b) =>
      Belt.List.concat(acc, insertionSort(b)))
  }
}

let data = list{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
let sorted = bucketSort(data)
Belt.List.forEach(sorted, x => Js.log2(x, ""))
