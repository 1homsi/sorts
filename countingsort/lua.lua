function countingSort(arr)
    local n = #arr
    if n == 0 then return arr end
    local max, min = arr[1], arr[1]
    for i = 2, n do
        if arr[i] > max then max = arr[i] end
        if arr[i] < min then min = arr[i] end
    end
    local range = max - min + 1
    local count = {}
    for i = 1, range do count[i] = 0 end
    for i = 1, n do count[arr[i] - min + 1] = count[arr[i] - min + 1] + 1 end
    for i = 2, range do count[i] = count[i] + count[i - 1] end
    local output = {}
    for i = n, 1, -1 do
        local idx = arr[i] - min + 1
        output[count[idx]] = arr[i]
        count[idx] = count[idx] - 1
    end
    return output
end

local result = countingSort({4, 2, 2, 8, 3, 3, 1})
for _, v in ipairs(result) do io.write(v .. " ") end
print()
