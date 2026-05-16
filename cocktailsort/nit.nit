fun cocktailsort(arr: Array[Int]) do
  var n = arr.length
  var i = 0
  while i < n do
    var swapped = false
    for k in [0 .. n - i - 2[ do
      if arr[k] > arr[k + 1] then
        var temp = arr[k]
        arr[k] = arr[k + 1]
        arr[k + 1] = temp
        swapped = true
      end
    end
    if not swapped then break
    i += 1
    swapped = false
    for k in [n - i - 2 .. 0[.reverse do
      if arr[k] > arr[k + 1] then
        var temp = arr[k]
        arr[k] = arr[k + 1]
        arr[k + 1] = temp
        swapped = true
      end
    end
    if not swapped then break
    i += 1
  end
end

var arr = [5, 2, 8, 1, 9, 3]
cocktailsort(arr)
print arr
