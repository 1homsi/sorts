local function selection_sort(arr)
  local n = #arr
  for i = 1, n - 1 do
    local min_idx = i
    for j = i + 1, n do
      if arr[j] < arr[min_idx] then
        min_idx = j
      end
    end
    arr[i], arr[min_idx] = arr[min_idx], arr[i]
  end
  return arr
end

local result = selection_sort({5, 2, 8, 1, 9, 3})
for _, v in ipairs(result) do
  print(v)
end