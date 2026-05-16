local function counting_sort(arr, exp)
    local n = #arr
    local output = {}
    local count = {}
    for i = 0, 9 do count[i] = 0 end
    for i = 1, n do
        local idx = math.floor(arr[i] / exp) % 10
        count[idx] = count[idx] + 1
    end
    for i = 1, 9 do count[i] = count[i] + count[i - 1] end
    for i = n, 1, -1 do
        local idx = math.floor(arr[i] / exp) % 10
        output[count[idx]] = arr[i]
        count[idx] = count[idx] - 1
    end
    for i = 1, n do arr[i] = output[i] end
end

local function radix_sort(arr)
    if #arr == 0 then return arr end
    local max = arr[1]
    for i = 2, #arr do if arr[i] > max then max = arr[i] end end
    local exp = 1
    while math.floor(max / exp) > 0 do
        counting_sort(arr, exp)
        exp = exp * 10
    end
    return arr
end

local arr = {170, 45, 75, 90, 802, 24, 2, 66}
radix_sort(arr)
print(table.concat(arr, ", "))
