let compareAndSwap = (arr: array<int>, i: int, j: int, direction: bool) => {
  let ai = arr[i]
  let aj = arr[j]
  if direction == (ai > aj) {
    arr[i] = aj
    arr[j] = ai
  }
}

let rec bitonicMerge = (arr: array<int>, lo: int, cnt: int, direction: bool) => {
  if cnt > 1 {
    let k = cnt / 2
    for i in lo to lo + k - 1 {
      compareAndSwap(arr, i, i + k, direction)
    }
    bitonicMerge(arr, lo, k, direction)
    bitonicMerge(arr, lo + k, k, direction)
  }
}

let rec bitonicSort = (arr: array<int>, lo: int, cnt: int, direction: bool) => {
  if cnt > 1 {
    let k = cnt / 2
    bitonicSort(arr, lo, k, true)
    bitonicSort(arr, lo + k, k, false)
    bitonicMerge(arr, lo, cnt, direction)
  }
}

let data = [3, 7, 4, 8, 6, 2, 1, 5]
bitonicSort(data, 0, Array.length(data), true)
Js.log(data)
