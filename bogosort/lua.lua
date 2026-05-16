math.randomseed(os.time())

local function isSorted(arr)
    for i = 1, #arr - 1 do
        if arr[i] > arr[i + 1] then return false end
    end
    return true
end

local function shuffle(arr)
    for i = #arr, 2, -1 do
        local j = math.random(i)
        arr[i], arr[j] = arr[j], arr[i]
    end
end

local function bogosort(arr)
    while not isSorted(arr) do
        shuffle(arr)
    end
    return arr
end

local arr = {3, 1, 4, 1, 5, 9, 2, 6}
bogosort(arr)
print(table.concat(arr, ", "))
