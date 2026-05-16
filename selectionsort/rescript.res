let selectionSort = (arr: array<int>): array<int> => {
  let n = Belt.Array.length(arr)
  for i in 0 to n - 1 {
    let minIdx = ref(i)
    for j in i + 1 to n - 1 {
      if arr[j] < arr[minIdx.contents] {
        minIdx := j
      }
    }
    let tmp = arr[i]
    arr[i] = arr[minIdx.contents]
    arr[minIdx.contents] = tmp
  }
  arr
}
