function insertion_sort(bucket)
    for i = 2, #bucket do
        local key = bucket[i]
        local j = i - 1
        while j >= 1 and bucket[j] > key do
            bucket[j + 1] = bucket[j]
            j = j - 1
        end
        bucket[j + 1] = key
    end
    return bucket
end

function bucket_sort(arr)
    local n = #arr
    if n == 0 then return arr end
    local min_val = math.huge
    local max_val = -math.huge
    for _, v in ipairs(arr) do
        if v < min_val then min_val = v end
        if v > max_val then max_val = v end
    end
    local buckets = {}
    for i = 1, n do buckets[i] = {} end
    for _, num in ipairs(arr) do
        local idx = math.floor((num - min_val) / (max_val - min_val + 1) * n) + 1
        if idx > n then idx = n end
        table.insert(buckets[idx], num)
    end
    local result = {}
    for _, bucket in ipairs(buckets) do
        insertion_sort(bucket)
        for _, v in ipairs(bucket) do
            table.insert(result, v)
        end
    end
    return result
end

local data = {0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}
local sorted = bucket_sort(data)
for _, v in ipairs(sorted) do io.write(v .. " ") end
io.write("\n")
