local function compareAndSwap(arr, i, j, direction)
    if direction == (arr[i] > arr[j]) then
        arr[i], arr[j] = arr[j], arr[i]
    end
end

local function bitonicMerge(arr, lo, cnt, direction)
    if cnt > 1 then
        local k = math.floor(cnt / 2)
        for i = lo, lo + k - 1 do
            compareAndSwap(arr, i, i + k, direction)
        end
        bitonicMerge(arr, lo, k, direction)
        bitonicMerge(arr, lo + k, k, direction)
    end
end

local function bitonicSort(arr, lo, cnt, direction)
    if cnt > 1 then
        local k = math.floor(cnt / 2)
        bitonicSort(arr, lo, k, true)
        bitonicSort(arr, lo + k, k, false)
        bitonicMerge(arr, lo, cnt, direction)
    end
end

local data = {3, 7, 4, 8, 6, 2, 1, 5}
bitonicSort(data, 1, #data, true)
for _, v in ipairs(data) do io.write(v .. " ") end
print()
