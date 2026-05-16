local function cycleSort(arr)
  local n = #arr
  local pos = 0
  while pos < n do
    local item = arr[pos]
    local cycles = 0
    for i = 0, n-1 do
      if i ~= pos and arr[i] < item then
        cycles = cycles + 1
      end
    end
    if cycles ~= 0 then
      while arr[pos] == item do
        pos = pos + 1
      end
      local temp = arr[pos]
      arr[pos] = item
      item = temp
      while cycles > 0 do
        cycles = 0
        for i = 0, n-1 do
          if i ~= pos and arr[i] < item then
            cycles = cycles + 1
          end
        end
        while arr[pos] == item do
          pos = pos + 1
        end
        temp = arr[pos]
        arr[pos] = item
        item = temp
        cycles = cycles - 1
      end
    end
    pos = pos + 1
  end
  return arr
end

local result = cycleSort({5, 2, 8, 1, 9, 3})
print(result)
