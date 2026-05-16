local MIN_RUN = 32

local function insertion_sort(arr, left, right)
    for i = left + 1, right do
        local key = arr[i]
        local j = i - 1
        while j >= left and arr[j] > key do
            arr[j + 1] = arr[j]
            j = j - 1
        end
        arr[j + 1] = key
    end
end

local function merge(arr, left, mid, right)
    local left_part = {}
    local right_part = {}
    for i = left, mid do left_part[#left_part + 1] = arr[i] end
    for i = mid + 1, right do right_part[#right_part + 1] = arr[i] end
    local i, j, k = 1, 1, left
    while i <= #left_part and j <= #right_part do
        if left_part[i] <= right_part[j] then
            arr[k] = left_part[i]; i = i + 1
        else
            arr[k] = right_part[j]; j = j + 1
        end
        k = k + 1
    end
    while i <= #left_part do arr[k] = left_part[i]; i = i + 1; k = k + 1 end
    while j <= #right_part do arr[k] = right_part[j]; j = j + 1; k = k + 1 end
end

local function timsort(arr)
    local n = #arr
    local i = 1
    while i <= n do
        insertion_sort(arr, i, math.min(i + MIN_RUN - 1, n))
        i = i + MIN_RUN
    end
    local size = MIN_RUN
    while size < n do
        local left = 1
        while left <= n do
            local mid = math.min(left + size - 1, n)
            local right = math.min(left + 2 * size - 1, n)
            if mid < right then merge(arr, left, mid, right) end
            left = left + 2 * size
        end
        size = size * 2
    end
    return arr
end

local arr = {5, 2, 8, 1, 9, 3, 7, 4, 6}
timsort(arr)
for _, v in ipairs(arr) do io.write(v .. " ") end
io.write("\n")
