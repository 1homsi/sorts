let combSort = (arr: array<int>): array<int> => {
  let n = Array.length(arr)
  let gap = ref(n)
  let sorted = ref(false)
  while !sorted.contents {
    gap := int_of_float(float_of_int(gap.contents) /. 1.3)
    if gap.contents <= 1 {
      gap := 1
      sorted := true
    }
    let i = ref(0)
    while i.contents + gap.contents < n {
      if arr[i.contents] > arr[i.contents + gap.contents] {
        let tmp = arr[i.contents]
        arr[i.contents] = arr[i.contents + gap.contents]
        arr[i.contents + gap.contents] = tmp
        sorted := false
      }
      i := i.contents + 1
    }
  }
  arr
}
