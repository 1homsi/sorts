local function insertionSort(arr)
  local n = #arr
  for i = 2, n do
    local key = arr[i]
    local j = i - 1
    while j > 0 and arr[j] > key do
      arr[j+1] = arr[j]
      j = j - 1
    end
    arr[j+1] = key
  end
  return arr
end

local arr = {5, 2, 8, 1, 9, 3}
print(table.concat(insertionSort(arr), " "))