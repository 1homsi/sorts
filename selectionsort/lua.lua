function selectionSort(arr)
    local n = #arr
    for i = 1, n do
        local minIdx = i
        for j = i + 1, n do
            if arr[j] < arr[minIdx] then minIdx = j end
        end
        arr[i], arr[minIdx] = arr[minIdx], arr[i]
    end
    return arr
end
