function quicksort(arr, low, high)
  low = low or 1
  high = high or #arr
  if low < high then
    local pivot = arr[high]
    local i = low - 1
    for j = low, high - 1 do
      if arr[j] <= pivot then
        i = i + 1
        arr[i], arr[j] = arr[j], arr[i]
      end
    end
    arr[i+1], arr[high] = arr[high], arr[i+1]
    local p = i + 1
    quicksort(arr, low, p - 1)
    quicksort(arr, p + 1, high)
  end
end

local arr = {3, 6, 8, 10, 1, 2, 1}
quicksort(arr)
for _, v in ipairs(arr) do io.write(v .. " ") end
