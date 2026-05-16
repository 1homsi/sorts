countingSort = (arr) ->
  return arr if arr.length is 0
  min = Math.min arr...
  max = Math.max arr...
  range = max - min + 1
  count = (0 for _ in [0...range])
  count[v - min]++ for v in arr
  count[i] += count[i-1] for i in [1...range]
  output = new Array arr.length
  for i in [arr.length-1..0] by -1
    count[arr[i] - min]--
    output[count[arr[i] - min]] = arr[i]
  output

console.log countingSort [4, 2, 2, 8, 3, 3, 1]
