fun gnomesort(arr: Array[Int]): Array[Int] do
  var i = 0
  while i < arr.length do
    if i == 0 then
      i += 1
    else if arr[i] < arr[i - 1] then
      var temp = arr[i]
      arr[i] = arr[i - 1]
      arr[i - 1] = temp
      i -= 1
    else
      i += 1
    end
  end
  return arr
end

var test = [5, 2, 8, 1, 9, 3]
print gnomesort(test)
