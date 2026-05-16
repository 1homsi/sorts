local terra bubblesort(arr : &int32, n : int32)
  for i = 0, n do
    for j = 0, n - 1 - i do
      if arr[j] > arr[j+1] then
        var temp = arr[j]
        arr[j] = arr[j+1]
        arr[j+1] = temp
      end
    end
  end
end

local arr : int32[6] = [5, 2, 8, 1, 9, 3]
bubblesort(&arr[0], 6)