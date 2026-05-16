counting-sort = (arr) ->
  return arr unless arr.length
  min = Math.min ...arr
  max = Math.max ...arr
  range = max - min + 1
  count = Array range .fill 0
  for v in arr then count[v - min]++
  for i from 1 til range then count[i] += count[i - 1]
  output = Array arr.length
  for i from arr.length - 1 to 0 by -1
    count[arr[i] - min]--
    output[count[arr[i] - min]] = arr[i]
  output

console.log counting-sort [4, 2, 2, 8, 3, 3, 1]
