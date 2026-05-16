let shellSort = (arr: array<int>): array<int> => {
  let n = Array.length(arr)
  let gap = ref(n / 2)
  while gap.contents > 0 {
    for i in gap.contents to n - 1 {
      let temp = arr[i]
      let j = ref(i)
      while j.contents >= gap.contents && arr[j.contents - gap.contents] > temp {
        arr[j.contents] = arr[j.contents - gap.contents]
        j := j.contents - gap.contents
      }
      arr[j.contents] = temp
    }
    gap := gap.contents / 2
  }
  arr
}

let arr = [64, 34, 25, 12, 22, 11, 90]
let sorted = shellSort(arr)
Js.log(sorted)
