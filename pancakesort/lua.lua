function flip(arr, k)
    local left, right = 1, k + 1
    while left < right do
        arr[left], arr[right] = arr[right], arr[left]
        left = left + 1
        right = right - 1
    end
end

function pancake_sort(arr)
    local n = #arr
    for size = n, 2, -1 do
        local max_idx = 1
        for i = 2, size do
            if arr[i] > arr[max_idx] then max_idx = i end
        end
        if max_idx ~= size then
            if max_idx ~= 1 then flip(arr, max_idx - 1) end
            flip(arr, size - 1)
        end
    end
end

local arr = {3, 6, 2, 7, 4, 1, 5}
pancake_sort(arr)
for _, v in ipairs(arr) do io.write(v .. " ") end
print()
