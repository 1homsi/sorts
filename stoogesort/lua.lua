function stoogeSort(arr, first, last)
    if arr[first] > arr[last] then
        arr[first], arr[last] = arr[last], arr[first]
    end
    if last - first + 1 > 2 then
        local t = math.floor((last - first + 1) * 2 / 3)
        stoogeSort(arr, first, first + t - 1)
        stoogeSort(arr, last - t + 1, last)
        stoogeSort(arr, first, first + t - 1)
    end
end

local arr = {3, 1, 4, 1, 5, 9, 2, 6}
stoogeSort(arr, 1, #arr)
for i, v in ipairs(arr) do io.write(v .. " ") end
print()
