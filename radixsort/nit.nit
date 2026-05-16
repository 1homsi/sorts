fun radixsort(arr: Array[Int]): Array[Int] do
  var max = arr[0]
  for x in arr do
    if x > max then max = x
  end
  var exp = 1
  while max / exp > 0 do
    arr = countingSortByExp(arr, exp)
    exp = exp * 10
  end
  return arr
end

fun countingSortByExp(arr: Array[Int], exp: Int): Array[Int] do
  var n = arr.length
  var output = new Array[Int](n)
  var count = new Array[Int](10)

  for i in [0 .. n[ do
    count[(arr[i] / exp) % 10] += 1
  end

  for i in [1 .. 10[ do
    count[i] += count[i - 1]
  end

  for i in [n - 1 .. -1 .. 0[ do
    output[count[(arr[i] / exp) % 10] - 1] = arr[i]
    count[(arr[i] / exp) % 10] -= 1
  end

  return output
end

print radixsort([5, 2, 8, 1, 9, 3])
