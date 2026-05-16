local function countingsort(arr)
  if #arr == 0 then return arr end

  local max = 0
  for i = 1, #arr do
    if arr[i] > max then max = arr[i] end
  end

  local count = {}
  for i = 0, max do count[i] = 0 end

  for i = 1, #arr do
    count[arr[i]] = count[arr[i]] + 1
  end

  local output = {}
  for i = 0, max do
    for j = 1, count[i] do
      table.insert(output, i)
    end
  end

  return output
end

local test = {5, 2, 8, 1, 9, 3}
print(table.concat(countingsort(test), ", "))
