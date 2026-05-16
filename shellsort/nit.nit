var arr = [5, 2, 8, 1, 9, 3]
var n = arr.length
var gap = 1
while gap <= n do gap = gap * 3 + 1
while gap > 0 do
  gap = gap / 3
  for i in gap..(n - 1) do
    var temp = arr[i]
    var j = i
    while j >= gap and arr[j - gap] > temp do
      arr[j] = arr[j - gap]
      j -= gap
    end
    arr[j] = temp
  end
end
print arr
