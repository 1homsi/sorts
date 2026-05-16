function bogosort(arr)
  while not issorted(arr) do
    shuffle(arr)
  end
  return arr
end

function issorted(arr)
  for i = 0, #arr - 1 do
    if arr[i] > arr[i + 1] then
      return false
    end
  end
  return true
end

function shuffle(arr)
  for i = 0, #arr - 1 do
    local j = math.random(0, #arr)
    arr[i], arr[j] = arr[j], arr[i]
  end
end

local arr = {3, 1, 2}
bogosort(arr)
print(table.concat(arr, ' '))
