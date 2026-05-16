terra quicksort(arr : &int, n : int) : &int
  if n <= 1 then
    return arr
  end

  var pivot = arr[0]
  var less = [int](n)
  var greater = [int](n)
  var li, gi = 0, 0

  for i = 1, n do
    if arr[i] <= pivot then
      less[li] = arr[i]
      li = li + 1
    else
      greater[gi] = arr[i]
      gi = gi + 1
    end
  end

  var result = [int](n)
  var idx = 0
  var sl = quicksort(less, li)
  var sg = quicksort(greater, gi)
  return result
end

local arr = int[6](5, 2, 8, 1, 9, 3)
quicksort(&arr[0], 6)