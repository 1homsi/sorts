module countingsort

fun countingsort(arr: Array[Int]): Array[Int] do
  if arr.is_empty then return arr

  var max = 0
  for val in arr do
    if val > max then max = val
  end

  var count = new Array[Int].with_capacity(max + 1)
  for i in 0..max do count.add(0) end

  for val in arr do
    count[val] = count[val] + 1
  end

  var output = new Array[Int]
  for i in 0..max do
    for _j in 0..<count[i] do
      output.add(i)
    end
  end

  return output
end

var test = [5, 2, 8, 1, 9, 3]
print countingsort(test)
