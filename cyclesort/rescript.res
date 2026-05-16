let cycleSort = (arr: array<int>): int => {
  let writes = ref(0)
  let n = Array.length(arr)
  for cycleStart in 0 to n - 2 {
    let item = ref(arr[cycleStart])
    let pos = ref(cycleStart)
    for i in cycleStart + 1 to n - 1 {
      if arr[i] < item.contents {
        pos := pos.contents + 1
      }
    }
    if pos.contents != cycleStart {
      while item.contents == arr[pos.contents] {
        pos := pos.contents + 1
      }
      let tmp = arr[pos.contents]
      arr[pos.contents] = item.contents
      item := tmp
      writes := writes.contents + 1
      while pos.contents != cycleStart {
        pos := cycleStart
        for i in cycleStart + 1 to n - 1 {
          if arr[i] < item.contents {
            pos := pos.contents + 1
          }
        }
        while item.contents == arr[pos.contents] {
          pos := pos.contents + 1
        }
        let t = arr[pos.contents]
        arr[pos.contents] = item.contents
        item := t
        writes := writes.contents + 1
      }
    }
  }
  writes.contents
}

let arr = [5, 4, 3, 2, 1]
let _ = cycleSort(arr)
Js.log(arr)
