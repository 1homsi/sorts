local function heapsort(arr)
    local n = #arr
    for i = math.floor(n / 2) - 1, 0, -1 do
        siftdown(arr, i, n)
    end
    for i = n - 1, 1, -1 do
        local temp = arr[0]
        arr[0] = arr[i]
        arr[i] = temp
        siftdown(arr, 0, i)
    end
end

local function siftdown(arr, idx, n)
    local largest = idx
    local left = 2 * idx + 1
    local right = 2 * idx + 2
    if left < n and arr[left] > arr[largest] then
        largest = left
    end
    if right < n and arr[right] > arr[largest] then
        largest = right
    end
    if largest ~= idx then
        local temp = arr[idx]
        arr[idx] = arr[largest]
        arr[largest] = temp
        siftdown(arr, largest, n)
    end
end

local arr = {5, 2, 8, 1, 9, 3}
heapsort(arr)
for i, v in ipairs(arr) do
    print(v)
end
