fun quicksort(arr: Array[Int]): Array[Int] do
  if arr.length <= 1 then return arr
  var pivot = arr[0]
  var less = new Array[Int]
  var greater = new Array[Int]
  for i in [1..arr.length[ do
    if arr[i] <= pivot then
      less.push(arr[i])
    else
      greater.push(arr[i])
    end
  end
  var result = new Array[Int]
  for x in quicksort(less) do result.push(x)
  result.push(pivot)
  for x in quicksort(greater) do result.push(x)
  return result
end

var arr = new Array[Int]
arr.push(5); arr.push(2); arr.push(8)
arr.push(1); arr.push(9); arr.push(3)
print quicksort(arr)