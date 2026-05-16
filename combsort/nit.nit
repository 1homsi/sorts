module comb_sort

fun comb_sort(arr: Array[Int]): Array[Int] do
  var gap = arr.length
  var swapped = true
  while gap > 1 or swapped do
    gap = (gap * 10) / 13
    if gap < 1 then gap = 1
    swapped = false
    for i in [0 .. arr.length - gap - 1[ do
      if arr[i] > arr[i + gap] then
        var temp = arr[i]
        arr[i] = arr[i + gap]
        arr[i + gap] = temp
        swapped = true
      end
    end
  end
  return arr
end

var sample = [5, 2, 8, 1, 9, 3]
print comb_sort(sample)
