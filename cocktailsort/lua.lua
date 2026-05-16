function cocktailSort(arr)
    local swapped = true
    local start = 1
    local ending = #arr
    while swapped do
        swapped = false
        for i = start, ending - 1 do
            if arr[i] > arr[i + 1] then
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            end
        end
        if not swapped then break end
        swapped = false
        ending = ending - 1
        for i = ending - 1, start, -1 do
            if arr[i] > arr[i + 1] then
                arr[i], arr[i + 1] = arr[i + 1], arr[i]
                swapped = true
            end
        end
        start = start + 1
    end
    return arr
end
