function pancake_sort(arr)
    local n = #arr
    for i = n, 2, -1 do
        local max_idx = 1
        for j = 1, i do
            if arr[j] > arr[max_idx] then max_idx = j end
        end
        if max_idx ~= i then
            for k = 1, math.floor((max_idx) / 2) do
                arr[k], arr[max_idx - k + 1] = arr[max_idx - k + 1], arr[k]
            end
            for k = 1, math.floor(i / 2) do
                arr[k], arr[i - k + 1] = arr[i - k + 1], arr[k]
            end
        end
    end
    return arr
end
