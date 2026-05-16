function radixsort(arr: &int, n: int)
  var max = arr[0]
  for i = 1, n do
    if arr[i] > max then max = arr[i] end
  end
  var exp = 1
  while max / exp > 0 do
    countingSortByExp(arr, n, exp)
    exp = exp * 10
  end
  return arr
end

function countingSortByExp(arr: &int, n: int, exp: int)
  var output = terralib.new(int[n])
  var count = terralib.new(int[10])
  for i = 0, 10 do count[i] = 0 end
  for i = 0, n do
    count[(arr[i] / exp) % 10] = count[(arr[i] / exp) % 10] + 1
  end
  for i = 1, 10 do
    count[i] = count[i] + count[i - 1]
  end
end

local arr = [int](`5`, `2`, `8`, `1`, `9`, `3`)
radixsort(arr, 6)
"")