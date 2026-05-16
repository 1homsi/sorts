let heapify = (arr: array<int>, n: int, i: int) => {
  let largest = ref(i)
  let left = 2 * i + 1
  let right = 2 * i + 2
  if left < n && arr[left] > arr[largest.contents] { largest := left }
  if right < n && arr[right] > arr[largest.contents] { largest := right }
  if largest.contents != i {
    let tmp = arr[i]
    arr[i] = arr[largest.contents]
    arr[largest.contents] = tmp
    heapify(arr, n, largest.contents)
  }
}

let heapsort = (arr: array<int>) => {
  let n = Array.length(arr)
  for i in n / 2 - 1 downto 0 { heapify(arr, n, i) }
  for i in n - 1 downto 1 {
    let tmp = arr[0]
    arr[0] = arr[i]
    arr[i] = tmp
    heapify(arr, i, 0)
  }
  arr
}

let arr = [12, 11, 13, 5, 6, 7]
let _ = heapsort(arr)
Js.log(arr)
