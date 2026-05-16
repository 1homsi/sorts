local function comb_sort(arr)
  local gap = #arr
  local swapped = true
  while gap > 1 or swapped do
    gap = math.floor(gap * 10 / 13)
    if gap < 1 then gap = 1 end
    swapped = false
    for i = 1, #arr - gap do
      if arr[i] > arr[i + gap] then
        local temp = arr[i]
        arr[i] = arr[i + gap]
        arr[i + gap] = temp
        swapped = true
      end
    end
  end
  return arr
end

local sample = {5, 2, 8, 1, 9, 3}
local result = comb_sort(sample)
for _, v in ipairs(result) do
  print(v)
end
