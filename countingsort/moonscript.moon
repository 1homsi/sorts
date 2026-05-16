counting_sort = (arr) ->
  return arr if #arr == 0
  min = math.min table.unpack arr
  max = math.max table.unpack arr
  range = max - min + 1
  count = [0 for i = 1, range]
  for v in *arr do count[v - min + 1] += 1
  for i = 2, range do count[i] += count[i - 1]
  output = [0 for i = 1, #arr]
  for i = #arr, 1, -1
    v = arr[i]
    idx = v - min + 1
    output[count[idx]] = v
    count[idx] -= 1
  output

result = counting_sort {4, 2, 2, 8, 3, 3, 1}
print table.concat result, " "
