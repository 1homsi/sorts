let flip = (arr, k) => {
  let left = ref(0)
  let right = ref(k)
  while left.contents < right.contents {
    let tmp = arr[left.contents]
    arr[left.contents] = arr[right.contents]
    arr[right.contents] = tmp
    left := left.contents + 1
    right := right.contents - 1
  }
}

let findMaxIdx = (arr, size) => {
  let maxIdx = ref(0)
  for i in 1 to size - 1 {
    if arr[i] > arr[maxIdx.contents] {
      maxIdx := i
    }
  }
  maxIdx.contents
}

let pancakeSort = arr => {
  let size = ref(Array.length(arr))
  while size.contents > 1 {
    let mi = findMaxIdx(arr, size.contents)
    if mi != size.contents - 1 {
      if mi != 0 { flip(arr, mi) }
      flip(arr, size.contents - 1)
    }
    size := size.contents - 1
  }
  arr
}

let arr = [3, 6, 2, 7, 4, 1, 5]
let _ = pancakeSort(arr)
Js.log(arr)
