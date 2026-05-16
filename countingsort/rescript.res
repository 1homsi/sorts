let countingSort = (arr: array<int>): array<int> => {
  let n = Array.length(arr)
  if n == 0 {
    arr
  } else {
    let minVal = Belt.Array.reduce(arr, arr[0], min)
    let maxVal = Belt.Array.reduce(arr, arr[0], max)
    let range = maxVal - minVal + 1
    let count = Belt.Array.make(range, 0)
    Belt.Array.forEach(arr, v => count[v - minVal] = count[v - minVal] + 1)
    for i in 1 to range - 1 {
      count[i] = count[i] + count[i - 1]
    }
    let output = Belt.Array.make(n, 0)
    for i in 0 to n - 1 {
      let i = n - 1 - i
      let v = arr[i]
      count[v - minVal] = count[v - minVal] - 1
      output[count[v - minVal]] = v
    }
    output
  }
}

Js.log(countingSort([4, 2, 2, 8, 3, 3, 1]))
