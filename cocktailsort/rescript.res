let cocktailSort = (arr: array<int>) => {
  let n = Belt.Array.length(arr)
  let swapped = ref(true)
  let start = ref(0)
  let ending = ref(n - 1)
  while swapped.contents {
    swapped := false
    for i in start.contents to ending.contents - 1 {
      if arr[i] > arr[i + 1] {
        let tmp = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = tmp
        swapped := true
      }
    }
    if swapped.contents {
      swapped := false
      ending := ending.contents - 1
      let i = ref(ending.contents - 1)
      while i.contents >= start.contents {
        if arr[i.contents] > arr[i.contents + 1] {
          let tmp = arr[i.contents]
          arr[i.contents] = arr[i.contents + 1]
          arr[i.contents + 1] = tmp
          swapped := true
        }
        i := i.contents - 1
      }
      start := start.contents + 1
    }
  }
  arr
}
