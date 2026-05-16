fun stoogesort(a: Array[Int], i: Int, j: Int) do
  if a[j] < a[i] then
    var temp = a[j]
    a[j] = a[i]
    a[i] = temp
  end
  if j - i > 1 then
    var t = (j - i + 1) / 3
    stoogesort(a, i, j - t)
    stoogesort(a, i + t, j)
    stoogesort(a, i, j - t)
  end
end

var arr = [5, 2, 8, 1, 9, 3]
stoogesort(arr, 0, 5)
print arr
