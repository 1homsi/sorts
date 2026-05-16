let bubbleSort = arr => {
  let n = ref(Array.length(arr))
  let swapped = ref(true)
  while swapped.contents {
    swapped := false
    for i in 0 to n.contents - 2 {
      if arr[i] > arr[i + 1] {
        let tmp = arr[i]
        arr[i] = arr[i + 1]
        arr[i + 1] = tmp
        swapped := true
      }
    }
    n := n.contents - 1
  }
  arr
}

let arr = [64, 34, 25, 12, 22, 11, 90]
let sorted = bubbleSort(arr)
Js.log(sorted)
