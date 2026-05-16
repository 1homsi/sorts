module selection_sort

fun selection_sort(arr: Array[Int]) do
  var n = arr.length
  for i in [0..n-2[ do
    var min_idx = i
    for j in [i+1..n[ do
      if arr[j] < arr[min_idx] then
        min_idx = j
      end
    end
    var tmp = arr[i]
    arr[i] = arr[min_idx]
    arr[min_idx] = tmp
  end
end

var arr = [5, 2, 8, 1, 9, 3]
selection_sort(arr)
print(arr.join(","))