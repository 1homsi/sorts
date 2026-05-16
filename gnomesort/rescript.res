let gnomeSort = (arr: array<int>): array<int> => {
  let n = Array.length(arr)
  let i = ref(0)
  while i.contents < n {
    if i.contents == 0 || arr[i.contents] >= arr[i.contents - 1] {
      i := i.contents + 1
    } else {
      let tmp = arr[i.contents]
      arr[i.contents] = arr[i.contents - 1]
      arr[i.contents - 1] = tmp
      i := i.contents - 1
    }
  }
  arr
}
